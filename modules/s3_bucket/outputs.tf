output "bucket_names" {
  description = "Names of created S3 buckets"
  value       = [for bucket in aws_s3_bucket.this : bucket.id]
}

