resource "aws_instance" "webserver" {
  ami = "ami-0cf2b4e024cdb6960"
  instance_type = "t2.micro"
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
  key_name = aws_key_pair.web.id
  vpc_security_group_ids = [ aws_security_group.ssh-access.id ]
}

resource "aws_key_pair" "web" {
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_security_group" "ssh-access" {
  name = "ssh-access"
  description = "Allow SSH access from the internet"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output publicip {
  value = aws_instance.webserver.public_ip
}