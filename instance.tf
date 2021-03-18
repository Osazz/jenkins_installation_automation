
resource "aws_security_group" "Jenkin_SG" {
  name        = "Jenkins_Server_SG"
  description = "Allow ssh and http access to jenkins server "

  dynamic "ingress" {
      for_each = var.sg_ports
      iterator = port
      content {
        from_port   = port.value
        to_port     = port.value
        protocol    = "tcp"
        cidr_blocks = var.cidr_block
      }
    }

    tags = merge(
      var.additional_tags,
      {
        Name = "Jenkins Server"
      },
    )
}


resource "aws_instance" "jenkins-instance" {
  ami           = var.aws_ami
  instance_type = "t2.micro"
  key_name      = "githubpair"
  user_data     = file("./create_jenkins.sh")

  tags = merge(
    var.additional_tags,
    {
      Name = "Jenkins Server"
    },
  )
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.Jenkin_SG.id
  network_interface_id = aws_instance.jenkins-instance.primary_network_interface_id
}
