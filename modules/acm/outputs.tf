# output "cname_records" {
#   description = "CNAME records for domain verification"
#   value       = [for record in aws_acm_certificate.cert.domain_validation_options : {
#     name  = record.resource_record_name
#     type  = record.resource_record_type
#     value = record.resource_record_value
#   }]
# }

output "certificate_arn" {
  description = "The ARN of the created ACM certificate"
  value       = aws_acm_certificate.imported_cert.arn
}

