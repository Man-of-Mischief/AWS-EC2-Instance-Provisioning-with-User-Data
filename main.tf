resource "aws_instance" "webserver" {
  ami                     = "ami-08333bccc35d71140"
  instance_type           = "t2.micro"
  key_name = "ohio"
  vpc_security_group_ids = ["sg-0d7f9e491313a05ef"]
  tags = {
    Name = "webserver"
    "project" = "zomato"
    "env" = "prod"
  }
}

resource "null_resource" "provision"{                                                       
    triggers = {
        userdata_ch = md5(file("userdata.sh"))
    }
    
    provisioner "file"{
        source = "userdata.sh"
        destination = "/tmp/userdata.sh"
    
    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("ohio.pem")
        host = aws_instance.webserver.public_ip
    }
    }
    provisioner "remote-exec"{
        inline = [
            "sudo chmod +x /tmp/userdata.sh",
            "sudo /tmp/userdata.sh"
        ]
    
    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("ohio.pem")
        host = aws_instance.webserver.public_ip
    }
    }
    provisioner "local-exec"{
    command = "echo public-ip ${aws_instance.webserver.public_ip} >> ip.txt"
}
}