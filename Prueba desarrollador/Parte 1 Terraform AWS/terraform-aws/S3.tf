resource "aws_s3_bucket" "bucket" {
  bucket = "bucket-de-prueba-para-datacycle-por-jfra"
}


resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "enc" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "life" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    id     = "expire"
    status = "Enabled"

    expiration {
      days = 15
    }
  }
}

