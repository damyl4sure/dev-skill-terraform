# # Create EBS volume
# resource "aws_ebs_volume" "ebs_vol" {
#   availability_zone = "eu-central-1a"
#   size              = var.volume_size

#   tags = {
#     Name = var.name
#   }
# }


# # Attach volume to EC2 Instance
# resource "aws_volume_attachment" "ebs_att" {
#   device_name = "/dev/sdc"
#   volume_id   = aws_ebs_volume.ebs_vol.id
#   instance_id = aws_instance.web.id
# }