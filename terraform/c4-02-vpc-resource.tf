resource "aws_vpc" "Main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"

  tags = {
    Name = var.name
  }
}

# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "IGW" {
    vpc_id =  aws_vpc.Main.id

    tags = {
      Name = var.name
  }
}

# Create a Public Subnets.
 resource "aws_subnet" "publicsubnets" {
     vpc_id =  aws_vpc.Main.id
     cidr_block = var.vpc_public_subnets
     availability_zone = "eu-central-1a"

     tags = {
       Name = var.name
  }
 }
# Create a Private Subnet
resource "aws_subnet" "privatesubnets" {
   vpc_id =  aws_vpc.Main.id
   cidr_block = var.vpc_private_subnets
   availability_zone = "eu-central-1a"
   map_public_ip_on_launch = true

   depends_on = [aws_internet_gateway.IGW]

   tags = {
     Name = var.name
  }
}

#Route table for Public Subnet's
resource "aws_route_table" "PublicRT" {
  vpc_id =  aws_vpc.Main.id
      route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id
      }

      tags = {
        Name = var.name
  }
}

#Route table for Private Subnet's
resource "aws_route_table" "PrivateRT" {
  vpc_id = aws_vpc.Main.id
      route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.NATgw.id
      }
      tags = {
        Name = var.name
  }

}

# Route table Association with Public Subnet's
resource "aws_route_table_association" "PublicRTassociation" {
  subnet_id = aws_subnet.publicsubnets.id
  route_table_id = aws_route_table.PublicRT.id
}

# Route table Association with Private Subnet's
resource "aws_route_table_association" "PrivateRTassociation" {
  subnet_id = aws_subnet.privatesubnets.id
  route_table_id = aws_route_table.PrivateRT.id
}

# resource "aws_eip" "nateIP" {
#   vpc = true
# }
#Creating the NAT Gateway using subnet_id and allocation_id
resource "aws_nat_gateway" "NATgw" {
  #allocation_id = aws_eip.nateIP.id
  allocation_id = aws_eip.attach.id
  subnet_id = aws_subnet.publicsubnets.id
  tags = {
        Name = var.name
  }
}