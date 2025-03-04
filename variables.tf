variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

# *********************************************************------- S3

variable "s3_bucket_names" {
  description = "List of S3 bucket names to create"
  type        = list(string)
}

variable "enable_versioning" {
  description = "Enable or disable versioning for the S3 bucket"
  type        = bool
  default     = true  # ✅ Use boolean instead of string
}



# variable "domain_name" {
#   description = "Primary domain for ACM"
#   type        = string
# }

# variable "alternate_domains" {
#   description = "List of alternative domains"
#   type        = list(string)
# }


# *********************************************************------- ACM

variable "private_key_path" {
  description = "Path to the private key"
  default     = ".ssl_certificates/private_key.pem"
}

variable "certificate_body_path" {
  description = "Path to the certificate body"
  default     = ".ssl_certificates/certificate.pem"
}

variable "ca_chain_path" {
  description = "Path to the CA chain"
  default     = ".ssl_certificates/ca_chain.pem"
}

# *********************************************************------- Cloudfront

variable "custom_domain" {
  description = "Custom domain for CloudFront"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for CloudFront origin"
  type        = string
}


