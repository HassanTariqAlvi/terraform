resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }


  lifecycle {
    prevent_destroy = true
  }
    deletion_protection_enabled = true
  point_in_time_recovery {
    enabled = true
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = "Production"
  }
}
