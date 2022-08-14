resource "aws_subnet" "private_cidrs_az" {
  count             = var.az_count_private 
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet_cidrs[format("zone%d", count.index)]
  availability_zone = element(split(", ", var.aws_azs), count.index)

  tags = {
    Name = "Private-${var.tags}"
  }
}

resource "aws_subnet" "public_cidrs_az" {
  count             = var.az_count_public 
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet_cidrs[format("zone%d", count.index)]
  availability_zone = element(split(", ", var.aws_azs), count.index)
  
  tags = {
    Name = "Public-${var.tags}"
  }
}
