resource "aws_acm_certificate" "safety" {
  domain_name       = "*.${var.domain_name}"
  validation_method = "DNS"

  tags = merge(
    local.common_tags,
    {
    Name = local.common_name_suffix
    }
  )
    lifecycle {
    create_before_destroy = true
  }
}

##verify the domain belongs to you or not DNS validation
resource "aws_route53_record" "safety" {
  for_each = {
    for dvo in aws_acm_certificate.safety.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 1
  type            = each.value.type
  zone_id         = var.zone_id
}

resource "aws_acm_certificate_validation" "safety" {
  certificate_arn         = aws_acm_certificate.safety.arn
  validation_record_fqdns = [for record in aws_route53_record.safety : record.fqdn]
}

