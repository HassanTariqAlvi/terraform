variable "bucket_names" {
  description = "List of S3 bucket names to create"
  type        = list(string)
}

variable "enable_versioning" {
  description = "Enable or disable versioning for the S3 bucket"
  type        = bool
}
