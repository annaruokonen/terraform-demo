provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket         = "tf-state-gofore-demo-dev"
    dynamodb_table = "tf-state-gofore-demo-dev"
    key            = "dev.tfstate"
  }

  required_version = "1.3.4"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 1.13"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket

# resource "aws_s3_bucket" "b" {
#   bucket = "annas-first-bucket"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }

# resource "aws_s3_bucket_acl" "example" {
#   bucket = aws_s3_bucket.b.id
#   acl    = "private"
# }