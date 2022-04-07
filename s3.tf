resource "aws_s3_bucket" "terrafrom907" {
  bucket = "terrform907"

  tags = {
    Name        = "my terraform"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.terrafrom907.id
  acl    = "private"
}
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.terrafrom907.id
  versioning_configuration {
    status = "Enabled"
  }
}