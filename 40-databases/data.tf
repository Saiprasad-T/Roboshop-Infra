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

data "aws_ssm_parameter" "monogdb-sg-id" {
  name = "/${var.project}/${var.environment}/mongodb-sg-id" 
}