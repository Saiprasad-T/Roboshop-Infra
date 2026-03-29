resource "aws_ssm_parameter" "listener_arn" {
  name  = "/${var.project}/${var.environment}/frotend_listener_arn" 
  type  = "String"
  value = aws_lb_listener.default_listener.arn
   overwrite = true
}

