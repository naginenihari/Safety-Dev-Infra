# Using Open source module
/*  module "catalogue" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${local.common_name_suffix}-catalogue"
  use_name_prefix = false
  description = "Security group for catalogue with custom ports open within VPC, egress all traffic"
  vpc_id      = data.aws_ssm_parameter.vpc_id.value

} */

##module git url:https://github.com/naginenihari/Terraform-Module-SG.git

module "sg" {
  count = length(var.sg_names)
  source = "git::https://github.com/naginenihari/Terraform-Module-SG.git?ref=main"
  project_name=var.project_name
  environment=var.environment
  sg_name=var.sg_names[count.index]
  sg_description="created for ${var.sg_names[count.index]} services"
  vpc_id=local.vpc_id
}

# Frontend accepting traffic from frontend ALB
# resource "aws_security_group_rule" "frontend-frontend_alb"{
#   type="ingress"
#   security_group_id = module.sg[9].sg_id
#   source_security_group_id = module.sg[11].sg_id
#   from_port = 80
#   protocol = "tcp"
#   to_port = 80
# }