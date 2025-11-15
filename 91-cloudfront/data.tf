data "aws_cloudfront_cache_policy" "cachingOptimised" {
  name = "Managed-CachingOptimized"
}

data "aws_cloudfront_cache_policy" "cachingDisabled" {
  name = "Managed-CachingDisabled"
}

data "aws_ssm_parameter" "cdn_certificate_arn" {
  name = "/${var.project_name}/${var.environment}/frontend_alb_certificate_arn"
}