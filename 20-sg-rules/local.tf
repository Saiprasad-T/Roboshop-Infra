locals {
    pub_ip = "${chomp(data.http.my_public_ip.response_body)}/32"
    bastion = data.aws_ssm_parameter.bastion-sg-id.value
    mongodb = data.aws_ssm_parameter.mongodb-sg-id.value
}