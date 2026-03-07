data "aws_ami" "ami" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }
}

data "aws_ssm_parameter" "public-snet" {
  name = "/${var.project}/${var.environment}/public-snet" 
}

/* data "aws_ssm_parameter" "vpc_id" {
  name = "/${var.project}/${var.environment}/vpc_id" 
} */

data "aws_ssm_parameter" "bastion-sg-id" {
  name = "/${var.project}/${var.environment}/bastion-sg-id" 
}