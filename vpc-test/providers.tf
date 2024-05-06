terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.48.0"
    }
  }
  backend "s3" {
    bucket = "robokart-tf-lock-state"
    key    = "env"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}