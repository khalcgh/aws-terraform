terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = "aws-tf-state-bucket"
}

resource "aws_s3_bucket_acl" "tfstate_bucket_acl" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "tfstate_bucket_versioning" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}