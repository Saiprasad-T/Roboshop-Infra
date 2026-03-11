resource "aws_lb" "backend_alb" {
  name               = "${var.project}-${var.environment}-backend-alb"   #roboshop-dev-bacakend-alb
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb-sg-id]
  subnets            = [local.private_snet]

  enable_deletion_protection = false

  tags = merge(
    local.common_tags,
    {
        Name =  "${var.project}-${var.environment}-backend-alb"
    },
    var.alb_tags
  )
}

#listner

resource "aws_lb_listener" "default_listner" {
  load_balancer_arn = aws_lb.backend_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "Hi Iam from backedn_alb"
      status_code  = "200"
    }
  }
}