variable "name" {}
variable "region" {}
variable "vpc_cidr_base" {}
variable "aws_azs" {}
variable "az_count_public" {}
variable "az_count_private" {}
variable "public_subnet_cidrs" {}
variable "private_subnet_cidrs" {}
variable "vpc_enable_dns_support" {
  default = "true"
}
variable "vpc_enable_dns_hostnames" {
  default = "true"
}
variable "tags" {}
variable "gateway_id" {}
variable "nat_gateway_id" {}
