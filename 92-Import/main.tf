resource "aws_instance" "demo" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = [
    "sg-04631c8350829b165"
  ]
  tags = {
    Name = "import-demo"
  }
}