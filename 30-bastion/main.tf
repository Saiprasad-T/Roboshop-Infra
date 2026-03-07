resource "aws_instance" "bastion_ec2" {
  ami                     = local.ami_id
  instance_type           = var.instance_type
  subnet_id               = local.public_snet[0]
  vpc_security_group_ids  = [local.sg_id]
  iam_instance_profile    = aws_iam_instance_profile.bastion_profile.name
  user_data = file("bastion.sh")  #this installs terraform and increase disk size
  root_block_device { #to increase device size to 50gib as tf providers are consuming more disk
    volume_size = 50
    volume_type = "gp3"
  }
  tags = merge(
    local.common_tags,
 {
    Name =  "${var.project}-${var.environment}-bastion"
 },
    var.ec2_tags
  )
}

#creating role for ec2

resource "aws_iam_role" "bastion_role" {
  name = "roboshop-dev-role"

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

#creating permisions for the role
resource "aws_iam_role_policy_attachment" "bastion_permission" {
  role       = aws_iam_role.bastion_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

#instance profile
resource "aws_iam_instance_profile" "bastion_profile" {
  name = "bastion-profile"
  role = aws_iam_role.bastion_role.name
}