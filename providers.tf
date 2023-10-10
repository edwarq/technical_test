terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.20.0"
    }
  }
}

provider "aws" {
  region = var.Region_aws
  access_key = var.access_key_aws
  secret_key = var.secret_key_aws

}