# public ip of my ec2 vm 
output "my-ec2-publicIP" {
  value = aws_instance.example[*].public_ip

}

# ec2 machine instance id 

output "my-ec2ID" {

  value = aws_instance.example[*].id

}
# storing data in local system 

resource "local_file" "ashu-data" {
  content  = "[ashu-roche]\n${join("\n", aws_instance.example[*].public_ip)}"
  filename = "${path.module}/ansible-inventory.txt"
  # making manual dependency 
  depends_on = [ aws_instance.example ]
}