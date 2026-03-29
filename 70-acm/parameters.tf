resource "aws_ssm_parameter" "acm_certificate" {
  name  = "/${var.project}/${var.environment}/acm_certificate_arn" 
  type  = "String"
  value = aws_acm_certificate.roboshop.arn
}

