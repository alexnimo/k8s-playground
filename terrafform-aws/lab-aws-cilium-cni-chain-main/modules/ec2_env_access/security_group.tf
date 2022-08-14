resource "aws_security_group" "allow_vnc_access" {
  name        = "SG-VNC-${var.tags}"
  description = "Allow VNC inbound traffic"
  vpc_id      = var.vpc_id
  
  ingress {
    description      = "VNC from VPC"
    from_port        = 5901
    to_port          = 5901
    protocol         = "tcp"
    cidr_blocks      = ["54.154.4.75/32"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SG-VNC-${var.tags}"
  }
}
