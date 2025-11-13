module "vpc" {

  source       = "git::https://github.com/naginenihari/Terraform-Module-VPC.git?ref=main"
  vpc_cidr     = var.vpc_cidr
  project_name = var.project_name
  environment  = var.environment
  vpc_tags     = var.vpc_tags

  ##Internet Gateway Creation here we don't have any user entering details

  ##Public Subnet details
  public_subnet_cidrs = var.public_subnet_cidrs

  ##Private Subnet details
  private_subnet_cidrs = var.private_subnet_cidrs

  ##Database Subnet details
  database_subnet_cidrs = var.database_subnet_cidrs

  is_peering_required = true
}




