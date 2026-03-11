data "aws_ssm_parameter" "private-snet" {
  name = "/${var.project}/${var.environment}/private-snet" 
}

data "aws_ssm_parameter" "backend_alb-sg-id" {
  name = "/${var.project}/${var.environment}/backend_alb-sg-id" 
}