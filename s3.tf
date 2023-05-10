resource "aws_s3_bucket" "bucklebuck" {
  bucket = "Bhashvika-mirna03"
  acl    = "private"

  tags = {
    Name        = "bhashvi bala"
    Environment = "UAT"
  }
}
