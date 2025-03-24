#PUB INSTANCE 1
resource "aws_instance" "web1" {
  ami           = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = true
  subnet_id = var.pubsub1_id
  vpc_security_group_ids = [var.pub_seg_sg_id]
  key_name = "vgs_mumbai"
  user_data = file("${path.module}/web-apps.sh")
  tags = {
    Name = "webserver1"
  }
  connection {
    type = "ssh"
    host = self.public_ip # Understand what is "self"
    user = "ec2-user"
    password = ""
    private_key = file("${path.module}/private-key/Mumbai-Linux.pem")
  }  
  provisioner "file" {
    source      = "${path.module}/apps/index.html"
    destination = "/tmp/index.html"
  }
  provisioner "remote-exec" {
    inline = [
      "sleep 120",  # Will sleep for 120 seconds to ensure Apache webserver is provisioned using user_data
      "sudo cp /tmp/index.html /var/www/html"
    ]
  }
}

#PUB INSTANCE 2
resource "aws_instance" "web2" {
  ami           = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = true
  subnet_id = var.pubsub2_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name = "vgs_mumbai"
  user_data = file("${path.module}/web-apps.sh")
  tags = {
    Name = "webserver2"
  }
  connection {
    type = "ssh"
    host = self.public_ip # Understand what is "self"
    user = "ec2-user"
    password = ""
    private_key = file("${path.module}/private-key/Mumbai-Linux.pem")
  }
  provisioner "file" {
    source      = "${path.module}/apps/index.html"
    destination = "/tmp/index.html"
  }
  provisioner "remote-exec" {
    inline = [
      "sleep 120",  # Will sleep for 120 seconds to ensure Apache webserver is provisioned using user_data
      "sudo cp /tmp/index.html /var/www/html"
    ]
  }
}

