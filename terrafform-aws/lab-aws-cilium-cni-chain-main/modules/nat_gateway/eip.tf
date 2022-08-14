resource "aws_eip" "eip" {
  vpc = true
  
  tags = {
    Name = "EIP-${var.tags}"
  }
}
