resource "aws_s3_bucket" "terraform_state" {
  bucket = "abc-bucket-faisalabad"
  force_destroy = false
}

# ✅ Enable Ownership Controls (Prevents ACL Issues)
resource "aws_s3_bucket_ownership_controls" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# ✅ Use this instead of ACLs for public access settings
resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

# ✅ Enable Versioning Properly
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
