resource "aws_ssm_parameter" "sg_id" {
  for_each = var.sg_names
  name  = "/${var.project}/${var.environment}/${each.key}-sg-id" #roboshop/dev/catalogue-sg_id
  type  = "String"
  value = module.sg[each.key].sg_id
}
