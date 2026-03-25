data "http" "my_public_ip" {
  url = "https://ipv4.icanhazip.com"
}

data "aws_ssm_parameter" "bastion-sg-id" {
  name = "/${var.project}/${var.environment}/bastion-sg-id" 
}

data "aws_ssm_parameter" "mongodb-sg-id" {
  name = "/${var.project}/${var.environment}/mongodb-sg-id" 
}

data "aws_ssm_parameter" "catalogue-sg-id" {
  name = "/${var.project}/${var.environment}/catalogue-sg-id" 
}

data "aws_ssm_parameter" "user-sg-id" {
  name = "/${var.project}/${var.environment}/user-sg-id" 
}
#===================================================================
data "aws_ssm_parameter" "redis-sg-id" {
  name = "/${var.project}/${var.environment}/redis-sg-id" 
}

data "aws_ssm_parameter" "cart-sg-id" {
  name = "/${var.project}/${var.environment}/cart-sg-id" 
}
#==================================================================
data "aws_ssm_parameter" "mysql-sg-id" {
  name = "/${var.project}/${var.environment}/mysql-sg-id" 
}
data "aws_ssm_parameter" "shipping-sg-id" {
  name = "/${var.project}/${var.environment}/shipping-sg-id" 
}
#===================================================================

data "aws_ssm_parameter" "payment-sg-id" {
  name = "/${var.project}/${var.environment}/payment-sg-id" 
}


data "aws_ssm_parameter" "rabbitmq-sg-id" {
  name = "/${var.project}/${var.environment}/rabbitmq-sg-id" 
}

data "aws_ssm_parameter" "backend-alb-sg-id" {
  name = "/${var.project}/${var.environment}/backend-alb-sg-id" 
}