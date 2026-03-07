resource "aws_instance" "mongodb" {
  ami                     = local.ami_id
  instance_type           = var.instance_type
  subnet_id               = local.database_snet[0]
  vpc_security_group_ids  = [local.sg_id]
  tags = merge(
    local.common_tags,
 {
    Name =  "${var.project}-${var.environment}-mongodb"
 },
    var.ec2_tags
  )
}

resource "terraform_data" "mongodb" {
  triggers_replace = [
    aws_instance.mongodb.id,
  ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.mongodb.private_ip  #Terraform stores these values in the state file.
  }

  provisioner "file" {
    source      = "bootstrap.sh" # Local file path
    destination = "/tmp/bootstrap.sh"    # Destination path on the remote machine
  }

  provisioner "remote-exec" {
     inline = [
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh"
    ]
  }
}