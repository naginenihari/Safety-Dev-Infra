# module "components" {
#   source = "../../Terraform-Safety-component"
#   component = var.component
#   rule_priority = var.rule_priority
# }


module "components" {
  for_each = var.component
  source = "git::https://github.com/naginenihariTerraform-Safety-component.git?ref=main"
  component = each.key
  rule_priority = each.value.var.rule_priority
}

