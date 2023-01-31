resource "aws_s3_bucket" "dl-edc-mod1-usecase" {
  bucket = "datalake-edc-mod1-usecase"
  tags = {
    IES = "IGTI"
    CURSO = "EDC"

  }

}

resource "aws_s3_bucket_acl" "datalake_bucket_acl" {
  bucket = aws_s3_bucket.dl-edc-mod1-usecase.id
  acl    = "private"
}


resource "aws_s3_bucket_server_side_encryption_configuration" "datalake_sse" {
  bucket = aws_s3_bucket.dl-edc-mod1-usecase.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  bucket = aws_s3_bucket.dl-edc-mod1-usecase.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [
    aws_s3_bucket.dl-edc-mod1-usecase
  ]
}


resource "aws_s3_bucket" "stream" {
  bucket = "igti-edc-streaming-bucket"

  tags = {
    IES   = "IGTI",
    CURSO = "EDC"
  }
}

resource "aws_s3_bucket_acl" "stream_bucket_acl" {
  bucket = aws_s3_bucket.stream.id
  acl    = "private"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "stream_sse" {
  bucket = aws_s3_bucket.stream.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_public_access_block" "stream_bucket_public_access_block" {
  bucket = aws_s3_bucket.stream.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [
    aws_s3_bucket.stream
  ]
}