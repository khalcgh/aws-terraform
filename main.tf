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

terraform {
  backend "s3" {
    bucket = "remote-state-tf-bucket"
    region = "eu-west-2"
    acl    = "private"
  }
}

resource "aws_s3_bucket" "tfstate_bucket" {
  bucket = "remote-state-tf-bucket"
}

resource "aws_s3_bucket_public_access_block" "tfstate_private" {
  bucket = aws_s3_bucket.tfstate_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "tfstate_bucket_versioning" {
  bucket = aws_s3_bucket.tfstate_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}