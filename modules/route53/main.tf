resource "aws_route53_zone" "main" {
  name = var.domain_name
}

resource "aws_route53_record" "primary" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.primary_elb_dns
    zone_id                = var.primary_elb_zone_id
    evaluate_target_health = true
  }

  set_identifier = "primary"
  failover_routing_policy {
    type = "PRIMARY"
  }
}

resource "aws_route53_record" "secondary" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.secondary_elb_dns
    zone_id                = var.secondary_elb_zone_id
    evaluate_target_health = true
  }

  set_identifier = "secondary"
  failover_routing_policy {
    type = "SECONDARY"
  }
}
