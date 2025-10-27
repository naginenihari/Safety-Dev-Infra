data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project_name}/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "backend_alb_sg_id" {
  name = "/${var.project_name}/${var.environment}/backend_alb/sg_id"
}

data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project_name}/${var.environment}/bastion/sg_id"
}