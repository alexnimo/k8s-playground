output "ec2_env_access_public_ip" {
  value = aws_instance.ec2_vnc.public_ip
}
