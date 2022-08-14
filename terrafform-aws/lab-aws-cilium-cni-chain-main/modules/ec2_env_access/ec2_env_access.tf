data "template_file" "startup_script" {
  template = "${file("${path.module}/ec2_script.sh")}"
  vars = {
    ec2_password          = var.ec2_password_var
    region                = var.region_var
    cluster_name          = var.cluster_name_var
  }
}

resource "aws_instance" "ec2_vnc" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet
  iam_instance_profile        = aws_iam_instance_profile.ec2_vnc_profile.name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_vnc_access.id]

  tags = {
    Name = "EC2-${var.tags}"
  }
  user_data   = data.template_file.startup_script.rendered
  
  depends_on = [
    var.cluster_name_var
  ]
}
