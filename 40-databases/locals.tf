locals {
    ami_id = data.aws_ami.ami.id
    database_snet = split(",", data.aws_ssm_parameter.database-snet.value)
    mongodb_sg_id = data.aws_ssm_parameter.mongodb-sg-id.value
    redis_sg_id = data.aws_ssm_parameter.redis-sg-id.value
    mysql_sg_id = data.aws_ssm_parameter.mysql-sg-id.value
    rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq-sg-id.value
    mysql_policy_name = 
}

locals {
    common_tags = {         #if not tags were given, this will fill common tags
        Name = var.project
        environment = var.environment
        terraform = true
    }
}