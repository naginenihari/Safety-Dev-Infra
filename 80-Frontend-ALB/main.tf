resource "aws_lb" "frontend_alb" {
  name               = "${local.common_name_suffix}-frontend-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.frontend_alb_sg_id]
  # it should be private subnet ids
  subnets            = local.public_subnet_ids

  enable_deletion_protection = false
  #enable_deletion_protection = true  ##Prevent accidental deletion from UI

 tags = merge (
        local.common_tags,
        {
            Name = "${var.project_name}-${var.environment}-frontend-alb"
        }
    )
}
  

    resource "aws_lb_listener" "frontend_alb" {
      load_balancer_arn = aws_lb.frontend_alb.arn
      port              = "443"
      protocol          = "HTTPS"
      ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-Res-2021-06" # added a more recent policy
      certificate_arn   = local.frontend_alb_certificate_arn # ARN of your SSL certificate
     
       default_action {
       type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1>Hi, am from frontend ALB HTTPS Health Check</h1>"
      status_code  = "200"
    }
  }

  }

    resource "aws_route53_record" "frontend_alb" {
  zone_id = var.zone_id
  name    = "safety-${var.environment}.${var.domain_name}"
  type    = "A"
  allow_overwrite = true

  alias {
  # These are ALB details, not our domain details
    name                   = aws_lb.frontend_alb.dns_name
    zone_id                = aws_lb.frontend_alb.zone_id
    evaluate_target_health = true
  }
}