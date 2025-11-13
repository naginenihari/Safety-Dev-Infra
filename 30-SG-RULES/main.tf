##---MongoDB SG Rules---##
# mongodb accepting traffic from  bastion on port 22
resource "aws_security_group_rule" "mongodb_bastion" {
  type                     = "ingress"
  security_group_id        = local.mongodb_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
# mongodb accepting traffic from catalogue on port number 27017
resource "aws_security_group_rule" "mongodb_catalogue" {
  type                     = "ingress"
  security_group_id        = local.mongodb_sg_id
  source_security_group_id = local.catalogue_sg_id
  from_port                = 27017
  protocol                 = "tcp"
  to_port                  = 27017
}
# mongodb accepting traffic from user on port number 27017
resource "aws_security_group_rule" "mongodb_user" {
  type                     = "ingress"
  security_group_id        = local.mongodb_sg_id
  source_security_group_id = local.user_sg_id
  from_port                = 27017
  protocol                 = "tcp"
  to_port                  = 27017
}

##---Redis DB SG Rules---##
# redis accepting traffic from  bastion on port number 22
resource "aws_security_group_rule" "redis_bastion" {
  type                     = "ingress"
  security_group_id        = local.redis_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
# redis accepting traffic from user on port number 6379
resource "aws_security_group_rule" "redis_user" {
  type                     = "ingress"
  security_group_id        = local.redis_sg_id
  source_security_group_id = local.user_sg_id
  from_port                = 6379
  protocol                 = "tcp"
  to_port                  = 6379
}
# redis accepting traffic from cart on port number 6379
resource "aws_security_group_rule" "redis_cart" {
  type                     = "ingress"
  security_group_id        = local.redis_sg_id
  source_security_group_id = local.cart_sg_id
  from_port                = 6379
  protocol                 = "tcp"
  to_port                  = 6379
}

##---Mysql DB SG Rules---##
# mysql accepting traffic from bastion on port number 22
resource "aws_security_group_rule" "mysql_bastion" {
  type                     = "ingress"
  security_group_id        = local.mysql_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
# mysql accepting traffic from shipping on port number 3306
resource "aws_security_group_rule" "mysql_shipping" {
  type                     = "ingress"
  security_group_id        = local.mysql_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port                = 3306
  protocol                 = "tcp"
  to_port                  = 3306
}

##---RabbitMQ DB SG Rules---##
# rabbitmq accepting traffic from bastion on port number 22
resource "aws_security_group_rule" "rabbitmq_bastion" {
  type                     = "ingress"
  security_group_id        = local.rabbitmq_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
# rabbitmq accepting traffic from payment on port number 5672
resource "aws_security_group_rule" "rabbitmq_payment" {
  type                     = "ingress"
  security_group_id        = local.rabbitmq_sg_id
  source_security_group_id = local.payment_sg_id
  from_port                = 5672
  protocol                 = "tcp"
  to_port                  = 5672
}

###### Catalogue SG Rules ######
# catalogue accepting traffic from bastion on port number 22
resource "aws_security_group_rule" "catalogue_bastion" {
  type                     = "ingress"
  security_group_id        = local.catalogue_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
# catalogue accepting traffic from backend-alb on port number 8080
resource "aws_security_group_rule" "catalogue_backend_alb" {
  type                     = "ingress"
  security_group_id        = local.catalogue_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port                = 8080
  protocol                 = "tcp"
  to_port                  = 8080
}

##### User SG Rules #####
#user accepting traffic from bastion on port number 22
resource "aws_security_group_rule" "user_bastion" {
  type                     = "ingress"
  security_group_id        = local.user_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
# user accepting traffic from backend-alb on port number 8080
resource "aws_security_group_rule" "user_backend_alb" {
  type                     = "ingress"
  security_group_id        = local.user_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port                = 8080
  protocol                 = "tcp"
  to_port                  = 8080
}

##### Cart SG Rules #####
# cart accepting traffic from bastion on port number 22
resource "aws_security_group_rule" "cart_bastion" {
  type                     = "ingress"
  security_group_id        = local.cart_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
# cart accepting traffic from backend-alb on port number 8080
resource "aws_security_group_rule" "cart_backend_alb" {
  type                     = "ingress"
  security_group_id        = local.cart_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port                = 8080
  protocol                 = "tcp"
  to_port                  = 8080
}

##### Shipping SG Rules #####
# shipping accepting traffic from bastion on port number 22
resource "aws_security_group_rule" "shipping_bastion" {
  type                     = "ingress"
  security_group_id        = local.shipping_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
# shipping accepting traffic from backend-alb on port number 8080
resource "aws_security_group_rule" "shipping_backend_alb" {
  type                     = "ingress"
  security_group_id        = local.shipping_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port                = 8080
  protocol                 = "tcp"
  to_port                  = 8080
}

##### Payment SG Rules #####
# payment accepting traffic from bastion on port number 22
resource "aws_security_group_rule" "payment_bastion" {
  type                     = "ingress"
  security_group_id        = local.payment_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
# payment accepting traffic from backend-alb on port number 8080
resource "aws_security_group_rule" "payment_backend_alb" {
  type                     = "ingress"
  security_group_id        = local.payment_sg_id
  source_security_group_id = local.backend_alb_sg_id
  from_port                = 8080
  protocol                 = "tcp"
  to_port                  = 8080
}
# payment accepting traffic from shipping on port number 8080
resource "aws_security_group_rule" "payment_shipping" {
  type                     = "ingress"
  security_group_id        = local.payment_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port                = 8080
  protocol                 = "tcp"
  to_port                  = 8080
}

##### Backend ALB SG Rules #####
# Backend-alb accepting traffic from bastion on port number 80
resource "aws_security_group_rule" "backend_alb-bastion" {
  type                     = "ingress"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 80
  protocol                 = "tcp"
  to_port                  = 80
}
# Backend-alb accepting traffic from frontend on port number 80
resource "aws_security_group_rule" "backend_alb_frontend" {
  type                     = "ingress"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.frontend_sg_id
  from_port                = 80
  protocol                 = "tcp"
  to_port                  = 80
}
# Backend-alb accepting traffic from cart on port number 80
resource "aws_security_group_rule" "backend_alb_cart" {
  type                     = "ingress"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.cart_sg_id
  from_port                = 80
  protocol                 = "tcp"
  to_port                  = 80
}
# Backend-alb accepting traffic from shipping on port number 80
resource "aws_security_group_rule" "backend_alb_shipping" {
  type                     = "ingress"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.shipping_sg_id
  from_port                = 80
  protocol                 = "tcp"
  to_port                  = 80
}
# Backend-alb accepting traffic from payment on port number 80
resource "aws_security_group_rule" "backend_alb_payment" {
  type                     = "ingress"
  security_group_id        = local.backend_alb_sg_id
  source_security_group_id = local.payment_sg_id
  from_port                = 80
  protocol                 = "tcp"
  to_port                  = 80
}

##### Frontend SG Rules #####
# Frontend accepting traffic from bastion on port number 22
resource "aws_security_group_rule" "frontend_bastion" {
  type                     = "ingress"
  security_group_id        = local.frontend_sg_id
  source_security_group_id = local.bastion_sg_id
  from_port                = 22
  protocol                 = "tcp"
  to_port                  = 22
}
# Frontend accepting traffic from frontend_alb on port number 80
resource "aws_security_group_rule" "frontend_frontend_alb" {
  type                     = "ingress"
  security_group_id        = local.frontend_sg_id
  source_security_group_id = local.frontend_alb_sg_id
  from_port                = 80
  protocol                 = "tcp"
  to_port                  = 80
}

##### Frontend ALB SG RUles #####
# Frontend-alb accepting traffic from public on port number 443
resource "aws_security_group_rule" "frontend_alb_public" {
  type              = "ingress"
  security_group_id = local.frontend_alb_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  to_port           = 443
}

##### Bastion SG RUles #####
# bastion accepting traffic from my laptop
resource "aws_security_group_rule" "bastion_laptop" {
  type              = "ingress"
  security_group_id = local.bastion_sg_id
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  to_port           = 22
}

/* # # This is the mistake we did, cart can't access catalogue component directly, it should be through backend ALB
# #catalogue accepting traffic from cart on port number 8080
#  resource "aws_security_group_rule" "catalogue_cart"{
#   type="ingress"
#   security_group_id =local.catalogue_sg_id
#   source_security_group_id = local.cart_sg_id
#   from_port = 8080
#   protocol = "tcp"
#   to_port = 8080
# }
# #This is the mistake we did, cart can't access components directly from one component to another component. they should be communicated through backend ALB
# # cart accepting traffic from shipping on port number 8080
# resource "aws_security_group_rule" "cart_shipping"{
#   type="ingress"
#   security_group_id =local.cart_sg_id
#   source_security_group_id = local.shipping_sg_id
#   from_port = 8080
#   protocol = "tcp"
#   to_port = 8080
# }
# # user accepting traffic from payment on port number 8080
# resource "aws_security_group_rule" "user_payment"{
#   type="ingress"
#   security_group_id =local.user_sg_id
#   source_security_group_id = local.payment_sg_id
#   from_port = 8080
#   protocol = "tcp"
#   to_port = 8080
# }
# # cart accepting traffic from payment on port number 8080
# resource "aws_security_group_rule" "cart_payment"{
#   type="ingress"
#   security_group_id =local.cart_sg_id
#   source_security_group_id = local.payment_sg_id
#   from_port = 8080
#   protocol = "tcp"
#   to_port = 8080
# }
# # Frontend accepting traffic from frontend ALB
# resource "aws_security_group_rule" "frontend-frontend_alb"{
#   type="ingress"
#   security_group_id = module.sg[9].sg_id
#   source_security_group_id = module.sg[11].sg_id
#   from_port = 80
#   protocol = "tcp"
#   to_port = 80
# } */