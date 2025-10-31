# # Frontend accepting traffic from frontend ALB
# resource "aws_security_group_rule" "frontend-frontend_alb"{
#   type="ingress"
#   security_group_id = module.sg[9].sg_id
#   source_security_group_id = module.sg[11].sg_id
#   from_port = 80
#   protocol = "tcp"
#   to_port = 80
# }

# Backend accepting traffic from bastion server
resource "aws_security_group_rule" "backend_alb-bastion"{
  type="ingress"
  security_group_id = local.backend_alb_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port = 80
  protocol = "tcp"
  to_port = 80
}

# bastion accepting traffic from my laptop
resource "aws_security_group_rule" "bastion_laptop"{
  type="ingress"
  security_group_id =local.bastion_sg_id
  cidr_blocks = ["0.0.0.0/0"]
  from_port = 22
  protocol = "tcp"
  to_port = 22
}

# mongodb accepting traffic from  bastion
resource "aws_security_group_rule" "mongodb_bastion"{
  type="ingress"
  security_group_id =local.mongodb_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
}

# redis accepting traffic from  bastion
resource "aws_security_group_rule" "redis_bastion"{
  type="ingress"
  security_group_id =local.redis_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port = 22
  protocol = "tcp"
  to_port = 22
}


