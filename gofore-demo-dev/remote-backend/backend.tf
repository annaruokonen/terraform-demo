resource "aws_s3_bucket" "terraform_state" {
  bucket = "tf-state-gofore-demo-dev"
     
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "tf-state-gofore-demo-dev"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}