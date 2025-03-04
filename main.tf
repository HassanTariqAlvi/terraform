terraform {
  backend "s3" {
    bucket        = "abc-bucket-faisalabad"
    key           = "terraform.tfstate"
    region        = "us-east-1"
    encrypt       = true
    use_lockfile  = true  # ✅ Recommended instead of DynamoDB
  }
}




# Specify the AWS Provider and Region
provider "aws" {
  region = var.aws_region
}


# *********************************************************------- S3
module "s3_bucket" {
  source       = "./modules/s3_bucket"
  bucket_names = var.s3_bucket_names
  enable_versioning  = var.enable_versioning
}

# Output the created buckets
output "created_buckets" {
  value = module.s3_bucket.bucket_names
}



# # Call the ACM module
# module "acm" {
#   source            = "./modules/acm"
#   domain_name       = var.domain_name
#   alternate_domains = var.alternate_domains
# }

# # Output the CNAME records
# output "cname_records" {
#   value = module.acm.cname_records
# }

# # Output the ACM ARN
# output "certificate_arn" {
#   value = module.acm.certificate_arn
# }

# *********************************************************------- ACM

module "acm" {
  source               = "./modules/acm"
  private_key_path     = var.private_key_path
  certificate_body_path = var.certificate_body_path
  ca_chain_path        = var.ca_chain_path
}

# Output the ACM ARN
output "certificate_arn" {
  value = module.acm.certificate_arn
}


# *********************************************************------ Cloudfront
# Use CloudFront with the ACM Certificate
module "cloudfront" {
  source              = "./modules/cloudfront"
  s3_bucket_name      = var.s3_bucket_name 
  custom_domain       = var.custom_domain  # ✅ Uses variable instead of hardcoded value
  acm_certificate_arn = module.acm.certificate_arn
}


# Output CloudFront URL
output "cloudfront_url" {
  value = module.cloudfront.cloudfront_url
}