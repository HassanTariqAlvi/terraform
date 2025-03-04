variable "s3_bucket_name" {
  description = "The name of the S3 bucket for CloudFront origin"
  type        = string
}

variable "custom_domain" {
  description = "Custom domain name for CloudFront (e.g., xyz.technoor.me)"
  type        = string
  default     = ""
}

variable "acm_certificate_arn" {
  description = "The ARN of the ACM certificate"
  type        = string
}
