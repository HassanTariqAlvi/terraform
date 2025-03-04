resource "aws_s3_bucket" "this" {
  for_each = toset(var.bucket_names)

  bucket = each.value
}

resource "aws_s3_bucket_versioning" "versioning" {
  for_each = aws_s3_bucket.this

  bucket = each.key

  versioning_configuration {
    status = var.enable_versioning ? "Enabled" : "Suspended"  # ✅ Uses boolean variable
  }
}



# Allow Public Access
resource "aws_s3_bucket_public_access_block" "public" {
  for_each = aws_s3_bucket.this

  bucket = each.key  

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}


# Attach a policy to allow public read access
resource "aws_s3_bucket_policy" "public_read" {
  for_each = aws_s3_bucket.this
  bucket   = each.key   

  policy   = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${each.key}/*"
        }
    ]
}
POLICY
}

