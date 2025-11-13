terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket       = "remote-state-aws-terraform"
    key          = "safety-dev-Frontend_alb-remote-state-file"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }

}
