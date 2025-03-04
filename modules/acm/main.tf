# # Request ACM Certificate
# resource "aws_acm_certificate" "cert" {
#   domain_name               = var.domain_name
#   validation_method         = "DNS"
#   subject_alternative_names = var.alternate_domains

#   lifecycle {
#     create_before_destroy = true
#   }
# }

# # Fetch DNS Validation Records
# resource "aws_acm_certificate_validation" "cert_validation" {
#   certificate_arn         = aws_acm_certificate.cert.arn
#   validation_record_fqdns = [for record in aws_acm_certificate.cert.domain_validation_options : record.resource_record_name]

#   timeouts {
#     create = "10m"
#   }
# }



resource "aws_acm_certificate" "imported_cert" {
  private_key      = file(var.private_key_path)
  certificate_body = file(var.certificate_body_path)
  certificate_chain = file(var.ca_chain_path)

  lifecycle {
    create_before_destroy = true
  }
}
