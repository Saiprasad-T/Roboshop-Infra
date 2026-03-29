data "aws_ssm_parameter" "public-snet" {
  name = "/${var.project}/${var.environment}/public-snet" 
}

data "aws_ssm_parameter" "frontend-alb-sg-id" {
  name = "/${var.project}/${var.environment}/frontend-alb-sg-id" 
}

data "aws_ssm_parameter" "acm_certificate" {
  name = "/${var.project}/${var.environment}/acm_certificate_arn" 
}