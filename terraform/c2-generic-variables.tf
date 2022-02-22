# Provisioning region
variable "aws_region" {
    description = "Region in which AWS resources would be created"
    type = string
    default = "eu-central-1"
}

variable "aws_profile" {
    description = "AWS configure profile accesskey & secret ID"
    type = string
    default = "lab2022"
}

# Environment Variable
variable "environment" {
    description = "Environment Variable used as a prefix"
    type = string
    default = "small-aws-environment"
}

variable "name" {
    description = "Resources name"
    type = string
    default = "dev-skill-test" 
}