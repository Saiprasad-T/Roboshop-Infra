locals {
    ami_id = data.aws_ami.ami.id
    public_snet = split(",", data.aws_ssm_parameter.database-snet.value)
    sg_id = data.aws_ssm_parameter.mongodb-sg-id.value
}

locals {
    common_tags = {         #if not tags were given, this will fill common tags
        Name = var.project
        environment = var.environment
        terraform = true
    }
}