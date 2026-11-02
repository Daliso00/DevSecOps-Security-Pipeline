resource "aws_s3_bucket" "test_bucket" {
  bucket = "portfolio-insecure-test-bucket"
}

resource "aws_s3_bucket_public_access_block" "test_bucket" {
  bucket = aws_s3_bucket.test_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
resource "aws_kms_key" "test_bucket" {
  description             = "KMS key for test S3 bucket encryption"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}
resource "aws_s3_bucket_server_side_encryption_configuration" "test_bucket" {
  bucket = aws_s3_bucket.test_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
      kms_master_key_id = aws_s3_bucket.arn
    }
  }
}
