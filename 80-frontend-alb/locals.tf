locals {
    public_snet = split(",", data.aws_ssm_parameter.public-snet.value)
    frontend_alb_sg_id = data.aws_ssm_parameter.frontend-alb-sg-id.value
    acm_certificate = data.aws_ssm_parameter.acm_certificate.value
}

locals {
    common_tags = {         #if not tags were given, this will fill common tags
        Name = var.project
        environment = var.environment
        terraform = true
    }
}