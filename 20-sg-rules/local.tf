locals {
    pub_ip = "${chomp(data.http.my_public_ip.response_body)}/32"
    bastion = data.aws_ssm_parameter.bastion-sg-id.value
    mongodb = data.aws_ssm_parameter.mongodb-sg-id.value
    catalogue = data.aws_ssm_parameter.catalogue-sg-id.value
    user = data.aws_ssm_parameter.user-sg-id.value
    cart = data.aws_ssm_parameter.cart-sg-id.value
    redis = data.aws_ssm_parameter.redis-sg-id.value
    mysql = data.aws_ssm_parameter.mysql-sg-id.value
    shipping = data.aws_ssm_parameter.shipping-sg-id.value
    payment = data.aws_ssm_parameter.payment-sg-id.value
    rabbitmq = data.aws_ssm_parameter.rabbitmq-sg-id.value
    backend_alb = data.aws_ssm_parameter.backend-alb-sg-id.value
    frontend_alb = data.aws_ssm_parameter.frontend-alb-sg-id.value
}