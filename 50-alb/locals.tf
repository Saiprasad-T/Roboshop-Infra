locals {
    private_snet = split(",", data.aws_ssm_parameter.private-snet.value)
    backend_alb-sg-id = data.aws_ssm_parameter.backend_alb-sg-id.value
}

locals {
    common_tags = {         #if not tags were given, this will fill common tags
        Name = var.project
        environment = var.environment
        terraform = true
    }
}