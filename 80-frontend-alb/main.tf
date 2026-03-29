resource "aws_lb" "frontend_alb" {
  name               = "${var.project}-${var.environment}-frontend-alb"   #roboshop-dev-frontend-alb
  internal           = false #as this public
  load_balancer_type = "application"
  security_groups    = [local.frontend_alb_sg_id]
  subnets            = local.public_snet

  enable_deletion_protection = false

  tags = merge(
    local.common_tags,
    {
        Name =  "${var.project}-${var.environment}-frontend-alb"
    },
    var.alb_tags
  )
}

#listner

resource "aws_lb_listener" "default_listener" {
  load_balancer_arn = aws_lb.frontend_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = local.acm_certificate

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "Hi Iam from frontend_alb"
      status_code  = "200"
    }
  }
}