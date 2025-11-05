# creating ec2 vm 
resource "aws_instance" "example" {
  ami           = "ami-0a25a306450a2cba3"
  instance_type = "t2.nano"
  key_name      = "roche-key"
  # changing tags_all to tags 
  tags = {
    "Name" = "ashu-vm-1"
  }

}