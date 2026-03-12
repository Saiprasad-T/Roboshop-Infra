resource "aws_instance" "catalogue" {
  ami                     = local.ami_id
  instance_type           = var.instance_type
  subnet_id               = local.private_snet[0]
  vpc_security_group_ids  = [local.catalogue_sg_id]
  tags = merge(
    local.common_tags,
 {
    Name =  "${var.project}-${var.environment}-catalogue"
 },
    var.ec2_tags
  )
}

resource "terraform_data" "catalogue" {   #triggering to mongodb
  triggers_replace = [
    aws_instance.catalogue.id,
  ]

  connection {   #connecting to catalogue
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.catalogue.private_ip  #Terraform stores these values in the state file.
  }

  provisioner "file" {
    source      = "bootstrap.sh" # Local file path
    destination = "/tmp/bootstrap.sh"    # Destination path on the remote machine
  }

  provisioner "remote-exec" {   #after connecting it executes this values
     inline = [
        "chmod +x /tmp/bootstrap.sh",   #giving execution permission
        "sudo sh /tmp/bootstrap.sh catalogue dev"     #running that bootstarp.sh
    ]
  }
}

#===============================================================================
#to stop ec2_instance

resource "aws_ec2_instance_state" "catalogue" {
  instance_id = aws_instance.catalogue.id
  state       = "stopped"

depends_on = [terraform_data.catalogue]
}

#=====================================================================================
#to take the ami

resource "aws_ami_from_instance" "catalogue" {
  name               = "catalogue-ami"
  source_instance_id = aws_instance.catalogue.id
}