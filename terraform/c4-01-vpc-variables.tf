# VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type = string 
  default = "dev-skill-test"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string 
  default = "10.0.0.0/16"
}

# VPC Availability Zones
variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type = string
  default = "eu-central-1a"
}

# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type = string
  default = "10.0.101.0/24"
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type = string
  default = "10.0.10.0/24"
}