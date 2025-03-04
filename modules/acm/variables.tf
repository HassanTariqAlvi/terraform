# variable "domain_name" {
#   description = "Primary domain for the certificate"
#   type        = string
# }

# variable "alternate_domains" {
#   description = "Additional domains (wildcard or subdomains)"
#   type        = list(string)
# }



variable "private_key_path" {
  description = "Path to the private key file"
  type        = string
  default     = "./ssl_certificates/private_key.pem"
}

variable "certificate_body_path" {
  description = "Path to the SSL certificate file"
  type        = string
  default     = "./ssl_certificates/certificate.pem"
}

variable "ca_chain_path" {
  description = "Path to the CA chain file"
  type        = string
  default     = "./ssl_certificates/ca_chain.pem"
}
