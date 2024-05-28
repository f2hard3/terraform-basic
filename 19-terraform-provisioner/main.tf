resource "aws_instance" "webserver" {
  ami = "ami-0cf2b4e024cdb6960"
  instance_type = "t2.micro"
  tags = {
    Name = "webserver"
    Description = "An Nginx Webserver on Ubuntu"
  }
  key_name = aws_key_pair.web.id
  vpc_security_group_ids = [ aws_security_group.ssh-access.id ]

  provisioner "remote-exec" {
    inline = [ 
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = file("~/.ssh/id_rsa")
    }
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> ./public_ip.txt"
  }

  provisioner "local-exec" {
    # on_failure = continue
    when = destroy
    command = "echo Instance ${self.public_ip} Destroyed > ./instance_state.txt"
  }
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