data "aws_ami" "ami" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }
}

data "aws_ssm_parameter" "database-snet" {
  name = "/${var.project}/${var.environment}/database-snet" 
}

/* data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project}/${var.environment}/vpc_id" 
} */

data "aws_ssm_parameter" "mongodb-sg-id" {
  name = "/${var.project}/${var.environment}/mongodb-sg-id" 
}

data "aws_ssm_parameter" "redis-sg-id" {
  name = "/${var.project}/${var.environment}/redis-sg-id" 
}

data "aws_ssm_parameter" "mysql-sg-id" {
  name = "/${var.project}/${var.environment}/mysql-sg-id" 
}

data "aws_ssm_parameter" "rabbitmq-sg-id" {
  name = "/${var.project}/${var.environment}/rabbitmq-sg-id" 
}