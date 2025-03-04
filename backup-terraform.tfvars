# *********************************************************------  Region DUMMY DATA


aws_region       = "us-east-1"

# *********************************************************------ S3

s3_bucket_names  = ["abc-bucket-faisalabad", "xyz-bucket-lahore"]
enable_versioning = true




# *********************************************************------ ACM

private_key_path = "ssl_certificates/private_key.pem"
certificate_body_path = "ssl_certificates/certificate.pem"
ca_chain_path = "ssl_certificates/ca_chain.pem"


# *********************************************************------ Cloudfront

custom_domain   = "xyz.technoor.me"
s3_bucket_name  = "xyz-bucket-lahore" 






