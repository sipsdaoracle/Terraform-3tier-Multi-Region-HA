output "route53_zone_id" {
  value       = aws_route53_zone.main.zone_id
  description = "The ID of the Route 53 hosted zone"
}

output "acm_certificate_arn" {
  value       = aws_acm_certificate.main.arn
  description = "The ARN of the ACM certificate"
}

output "ssh_key_name" {
  value       = aws_key_pair.main.key_name
  description = "The name of the created SSH key pair"
}
