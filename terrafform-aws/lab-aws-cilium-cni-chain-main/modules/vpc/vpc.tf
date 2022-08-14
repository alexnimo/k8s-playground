provider "aws" {
  region = var.region
}
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_base
  enable_dns_support   = var.vpc_enable_dns_support
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  tags = {
    Name = "${var.name}"
  }
}
