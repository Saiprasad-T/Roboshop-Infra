locals {
    ami_id = data.aws_ami.ami.id
    private_snet = split(",", data.aws_ssm_parameter.private-snet.value)
    catalogue_sg_id = data.aws_ssm_parameter.catalogue-sg-id.value
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    listner_arn = data.aws_ssm_parameter.listner_arn.value
}

locals {
    common_tags = {         #if not tags were given, this will fill common tags
        Name = var.project
        environment = var.environment
        terraform = true
    }
}