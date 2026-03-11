resource "aws_route53_record" "backend_alb" {
  zone_id = var.zone_id
  name    = "*.backend_alb.${var.domain}" #*.backend_alb.devopswiththota.online
  type    = "A"

  alias {
    name                   = aws_lb.backend_alb.dns_name
    zone_id                = aws_lb.backend_alb.zone_id
    evaluate_target_health = true
  }
}