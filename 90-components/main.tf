module "components" {
  source = "../../Terraform-Safety-component"
  component = var.component
  rule_priority = var.rule_priority
}