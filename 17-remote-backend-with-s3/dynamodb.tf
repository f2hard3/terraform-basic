resource "aws_dynamodb_table" "state-locking" {
  name = "state-locking"
  hash_key = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}