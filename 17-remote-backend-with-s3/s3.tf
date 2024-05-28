resource "aws_s3_bucket" "terraform-state-bucket" {
  bucket = "state-24052024"
  tags = {
    description = "terraform state bucket"
  }
}

resource "aws_s3_object" "terraform-state" {
  key = "finance/terraform.tfstate"
  bucket = aws_s3_bucket.terraform-state-bucket.id
}