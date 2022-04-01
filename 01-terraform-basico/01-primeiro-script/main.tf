terraform {
  required_version = "1.1.7"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "4.8.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "tf014"
}

resource "aws_s3_bucket" "my-test-bucket" {
  bucket = "my-tf-test-bucket-2039847230834323423"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
    Managedby   = "Terraform"
  }
}


resource "aws_s3_bucket_acl" "my-test-bucket-acl" {
  bucket = aws_s3_bucket.my-test-bucket.id
  acl    = "private"
}