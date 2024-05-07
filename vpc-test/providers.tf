terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
   backend "s3" {
    bucket = "robokart-tf-lock-state"
    key    = "dev"
    region = "us-east-1"
    dynamodb_table = "robokart-tf-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}