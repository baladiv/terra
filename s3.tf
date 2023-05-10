resource "aws_s3_bucket" "bucklebuck" {
  bucket = "bhashvika-mirna03"
  acl    = "public"

  tags = {
    Name        = "bhashvi bala"
    Environment = "UAT"
  }
}
