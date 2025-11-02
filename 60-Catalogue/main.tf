resource "aws_instance" "catalogue" {
    ami = local.ami_id
    instance_type = "t2.micro"
    vpc_security_group_ids = [local.catalogue_sg_id]
    subnet_id = local.private_subnet_id
    
    tags = merge (
        local.common_tags,
        {
            Name ="${local.common_name_suffix}-catalogue"
        }
    )
}

#Connect to instance  using remote-exec provisioners through terraform_data

resource "terraform_data" "catalogue" {
  triggers_replace = [
  aws_instance.catalogue.id
  ]

  connection {
  type="ssh"
  user="ec2-user"
  password="DevOps321"
  host=aws_instance.catalogue.private_ip
}

##Terraform copy this file to catalogue server
provisioner "file" {
    source = "catalogue.sh"
    destination = "/tmp/catalogue.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
        "chmod +x /tmp/catalogue.sh",
        "sudo sh /tmp/catalogue.sh catalogue ${var.environment}"
     ]
  }
}