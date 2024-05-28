terraform {
  backend "s3" {
    bucket = "state-24052024"
    key = "finance/terraform.tfstate"
    region = "us-west-2"
    dynamodb_table = "state-locking"
  }
}