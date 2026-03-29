module "components" {
  for_each = local.components
  source =  "git::https://github.com/Saiprasad-T/roboshop-components.git?ref=main"
  component = each.key
  rule_priority = each.value.priority
}