# Terraform Block
terraform {
    required_version = ">=0.13"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>3.5"
        }
    }
}

provider "aws" {
    # Configuration options
    profile = var.aws_profile
    region = var.aws_region
}