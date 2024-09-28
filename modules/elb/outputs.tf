output "elb_dns_name" {
  value = aws_lb.main.dns_name
}

output "elb_zone_id" {
  value = aws_lb.main.zone_id
}

output "elb_name" {
  value = aws_lb.main.name
}

output "target_group_arn" {
  value = aws_lb_target_group.main.arn
}

output "security_group_id" {
  value = aws_security_group.elb.id
}
