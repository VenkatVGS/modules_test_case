terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
    backend "remote" {
    hostname     = "venkatesh0608.scalr.io"  # Your Scalr hostname
    organization = "venkatesh0608"

    workspaces {
      name = "test-environment"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region_out
}