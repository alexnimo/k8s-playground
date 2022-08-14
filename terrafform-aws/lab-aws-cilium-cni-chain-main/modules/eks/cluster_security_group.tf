resource "aws_security_group" "allow_cluster_access" {
  name        = "SG-EKS-${var.tags}"
  description = "Allow Cluster inbound traffic"
  vpc_id      = var.vpc_id
  
  ingress {
    description      = "VNC from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["${var.aws_vpc_cidr}"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SG-EKS-${var.tags}"
  }
}
