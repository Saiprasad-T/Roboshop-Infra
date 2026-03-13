resource "aws_ssm_parameter" "listner_arn" {
  name  = "/${var.project}/${var.environment}/listner_arn" 
  type  = "String"
  value = aws_lb_listener.listner.arn
}