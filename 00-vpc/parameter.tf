resource "aws_ssm_parameter" "vpc_id" {
  name  = "/${var.project}/${var.environment}/vpc_id" #roboshop/dev/vpc_id
  type  = "String"
  value = module.vpc.vpc_id
}

resource "aws_ssm_parameter" "public" {
  name  = "/${var.project}/${var.environment}/public-snet" #roboshop/dev/public-snet
  type  = "StringList"
  value = join(",",module.vpc.public)   #as there are 2 subnets im using 
}

resource "aws_ssm_parameter" "private" {
  name  = "/${var.project}/${var.environment}/private-snet" #roboshop/dev/private-snet
  type  = "StringList"
  value = join(",",module.vpc.private)
}

resource "aws_ssm_parameter" "database" {
  name  = "/${var.project}/${var.environment}/database-snet" #roboshop/dev/database-snet
  type  = "StringList"
  value = join(",",module.vpc.database)
}