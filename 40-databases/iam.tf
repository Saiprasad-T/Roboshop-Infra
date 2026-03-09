#creating role for ec2

resource "aws_iam_role" "mysql_role" {
  name = "mysql-roboshop-dev-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

#creating policy
resource "aws_iam_policy" "mysql" {
  name        = "roboshop-${var.environment}-mysql-policy"
  description = "A policy for MySQL Ec2 instance"
  policy      = templatefile("mysql-iam-policy.json", {
                environment = var.environment
  })
}

#attaching policy to the role
resource "aws_iam_role_policy_attachment" "mysql_policy" {
  role       = aws_iam_role.mysql_role.name
  policy_arn = aws_iam_policy.mysql.arn
}

#instance profile
resource "aws_iam_instance_profile" "mysql_profile" {
  name = "mysql-profile"
  role = aws_iam_role.mysql_role.name
}
#==============================================================
resource "aws_iam_role" "rabbitmq_role" {
  name = "rabbitmq-roboshop-dev-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

#creating policy
resource "aws_iam_policy" "rabbitmq" {
  name        = "roboshop-${var.environment}-rabbitmq-policy"
  description = "A policy for MySQL Ec2 instance"
  policy      = templatefile("rabbitmq-iam-policy.json", {
                environment = var.environment
  })
}

#attaching policy to the role
resource "aws_iam_role_policy_attachment" "rabbitmq_policy" {
  role       = aws_iam_role.rabbitmq_role.name
  policy_arn = aws_iam_policy.rabbitmq.arn
}

#instance profile
resource "aws_iam_instance_profile" "rabbitmq_profile" {
  name = "rabbitmq-profile"
  role = aws_iam_role.rabbitmq_role.name
}