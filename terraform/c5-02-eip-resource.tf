resource "aws_network_interface" "pri_net_int" {
  subnet_id   = aws_subnet.privatesubnets.id
  private_ips = ["10.0.10.250"]

  # attachment {
  #   instance     = aws_instance.web.id
  #   device_index = 0
  # }

  tags = {
    Name = var.name
  }
}



resource "aws_eip" "attach" {
  vpc      = true

  #instance = aws_instance.web.id
  network_interface         = aws_network_interface.pri_net_int.id
  associate_with_private_ip = "10.0.10.250"
  depends_on = [aws_internet_gateway.IGW]

  tags = {
    Name = var.name
  }
}