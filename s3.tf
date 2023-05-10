resource "aws_s3_bucket" "bucklebuck" {
  bucket = "bhashvika mirna"
  acl    = "private"

  tags = {
    Name        = "bhashvi bala"
    Environment = "UAT"
  }
}
