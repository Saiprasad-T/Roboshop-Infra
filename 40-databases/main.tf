resource "aws_instance" "mongodb" {
  ami                     = local.ami_id
  instance_type           = var.instance_type
  subnet_id               = local.database_snet[0]
  vpc_security_group_ids  = [local.mongodb_sg_id]
  tags = merge(
    local.common_tags,
 {
    Name =  "${var.project}-${var.environment}-mongodb"
 },
    var.ec2_tags
  )
}

resource "terraform_data" "mongodb" {   #triggering to mongodb
  triggers_replace = [
    aws_instance.mongodb.id,
  ]

  connection {   #connecting to mongodb
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip  #Terraform stores these values in the state file.
  }

  provisioner "file" {
    source      = "bootstrap.sh" # Local file path
    destination = "/tmp/bootstrap.sh"    # Destination path on the remote machine
  }

  provisioner "remote-exec" {   #after connecting it executes this values
     inline = [
        "chmod +x /tmp/bootstrap.sh",   #giving execution permission
        "sudo sh /tmp/bootstrap.sh mongodb"     #running that bootstarp.sh
    ]
  }
}

#=======================================================================================

resource "aws_instance" "redis" {
  ami                     = local.ami_id
  instance_type           = var.instance_type
  subnet_id               = local.database_snet[0]
  vpc_security_group_ids  = [local.redis_sg_id]
  tags = merge(
    local.common_tags,
 {
    Name =  "${var.project}-${var.environment}-redis"
 },
    var.ec2_tags
  )
}

resource "terraform_data" "redis" {   
  triggers_replace = [
    aws_instance.redis.id,
  ]

  connection {   
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.redis.private_ip  
  }

  provisioner "file" {
    source      = "bootstrap.sh" 
    destination = "/tmp/bootstrap.sh"    
  }

  provisioner "remote-exec" {   #after connecting it executes this values
     inline = [
        "chmod +x /tmp/bootstrap.sh",   #giving execution permission
        "sudo sh /tmp/bootstrap.sh redis"     #running that bootstarp.sh
    ]
  }
}
#==========================================================================================

resource "aws_instance" "mysql" {
  ami                     = local.ami_id
  instance_type           = var.instance_type
  subnet_id               = local.database_snet[0]
  vpc_security_group_ids  = [local.mysql_sg_id]
  iam_instance_profile    = aws_iam_instance_profile.mysql_profile.name
  tags = merge(
    local.common_tags,
 {
    Name =  "${var.project}-${var.environment}-mysql"
 },
    var.ec2_tags
  )
}

resource "terraform_data" "mysql" {   
  triggers_replace = [
    aws_instance.redis.id,
  ]

  connection {   
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mysql.private_ip  
  }

  provisioner "file" {
    source      = "bootstrap.sh" 
    destination = "/tmp/bootstrap.sh"    
  }

  provisioner "remote-exec" {   #after connecting it executes this values
     inline = [
        "chmod +x /tmp/bootstrap.sh",   #giving execution permission
        "sudo sh /tmp/bootstrap.sh mysql dev"     #running that bootstarp.sh
    ]
  }
}
#=======================================================================================

resource "aws_instance" "mysql" {
  ami                     = local.ami_id
  instance_type           = var.instance_type
  subnet_id               = local.database_snet[0]
  vpc_security_group_ids  = [local.mysql_sg_id]
  iam_instance_profile    = aws_iam_instance_profile.mysql_profile.name
  tags = merge(
    local.common_tags,
 {
    Name =  "${var.project}-${var.environment}-mysql"
 },
    var.ec2_tags
  )
}

resource "terraform_data" "mysql_data" {   
  triggers_replace = [
    aws_instance.mysql.id,
  ]

  connection {   
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mysql.private_ip  
  }

  provisioner "file" {
    source      = "bootstrap.sh" 
    destination = "/tmp/bootstrap.sh"    
  }

  provisioner "remote-exec" {   #after connecting it executes this values
     inline = [
        "chmod +x /tmp/bootstrap.sh",   #giving execution permission
        "sudo sh /tmp/bootstrap.sh mysql dev"     #running that bootstarp.sh
    ]
  }
}