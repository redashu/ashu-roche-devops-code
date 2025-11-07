# creating ec2 vm 
resource "aws_instance" "example" {
  #ami           = "ami-0a25a306450a2cba3"
  count = var.novm
  ami =  var.ashu-ami-id
  instance_type = var.vm-size
  key_name      = var.ec2-key-name
  #security_groups = [ aws_security_group.allow_tls.name ]
  vpc_security_group_ids = [ aws_security_group.allow_tls.id  ]
  # changing tags_all to tags 
  tags = {
    "Name" = "${var.vm-name}-${count.index}"
  }
  # provisioner 
  provisioner "remote-exec" {
    inline = [ 
      "sudo dnf install git httpd mongodb-server -y",
      "mkdir -p  hello/terraform"
     ]
      
  }
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    timeout = "3m"
    # content of private key data 
    private_key = tls_private_key.example.private_key_pem
  }

}


