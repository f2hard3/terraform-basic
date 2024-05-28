resource "aws_instance" "webserver-2" {
  ami = "ami-0cf2b4e024cdb6960"
  instance_type = "t2.micro"
  key_name = "terraform-20240524075407901600000001"
  vpc_security_group_ids = ["sg-0430a7c1d5876ca00"]
  tags = {
    Name = "webserver"
    Description = "An Nginx Webserver on Ubuntu"
  }
  user_data = <<EOF
    #!/bin/bash
    sudo apt update
    sudo apt install nginx -y
    systemctl enable nginx
    systemctl start nginx
  EOF
}