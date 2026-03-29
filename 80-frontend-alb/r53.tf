resource "aws_route53_record" "frontend_alb" {
  zone_id = var.zone_id
  name    = "*.${var.domain}" #*.devopswiththota.online
  type    = "A"

  alias {
    name                   = aws_lb.frontend_alb.dns_name
    zone_id                = aws_lb.frontend_alb.zone_id
    evaluate_target_health = true
  }
}