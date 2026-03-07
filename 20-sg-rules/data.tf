data "http" "my_public_ip" {
  url = "https://ipv4.icanhazip.com"
}

data "aws_ssm_parameter" "bastion-sg-id" {
  name = "/${var.project}/${var.environment}/bastion-sg-id" 
}

data "aws_ssm_parameter" "mongodb-sg-id" {
  name = "/${var.project}/${var.environment}/mongodb-sg-id" 
}