# module "components" {
#   source = "../../Terraform-Safety-component"
#   component = var.component
#   rule_priority = var.rule_priority
# }


module "components" {
  for_each = var.components
  source = "git::https://github.com/naginenihari/Terraform-Safety-component.git?ref=main"
  component = each.key
  rule_priority = each.value.rule_priority
}
