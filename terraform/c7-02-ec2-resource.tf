resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  private_ip_address = "10.0.10.250"
  allocation_id = aws_eip.attach.id
  #network_interface_id = aws_network_interface.pri_net_int.id
}

# resource "aws_network_interface_attachment" "test" {
#   instance_id          = aws_instance.web.id
#   network_interface_id = aws_network_interface.pri_net_int.id
#   device_index         = 0
# }

resource "aws_instance" "web" {
  ami               = "ami-0be656e75e69af1a9"
  availability_zone = "eu-central-1a"
  instance_type     = var.instance_type
  #subnet_id   = aws_subnet.privatesubnets.id
  #private_ip = aws_network_interface.pri_net_int[0]

  network_interface {
        device_index            = 0
        network_interface_id    = "${aws_network_interface.pri_net_int.id}"
    }
  
  root_block_device {
    #device_name = "/dev/sdc"
    volume_size = 16
    volume_type = "gp2"
    #encrypted             = true
    delete_on_termination = true
  }

  # ebs data disk
  ebs_block_device {
    device_name = "/dev/sdc"
    volume_size = 5
    volume_type = "gp2"
    #encrypted             = true
    delete_on_termination = true
  }
  
  tags = {
    Name = var.name
  }
}