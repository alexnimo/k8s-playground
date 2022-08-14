output "aws_subnet_private_cidrs_az" {
  value = aws_subnet.private_cidrs_az.*.id
}
output "aws_subnet_public_cidrs_az" {
  value = aws_subnet.public_cidrs_az[0].id
}
output "aws_vpc_id" {
  value = aws_vpc.vpc.id
}
output "aws_vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}
output "tags" {
  value = "${lookup(aws_vpc.vpc.tags, "Name")}"
}
output "argocd_password" {
  value = "${lookup(aws_vpc.vpc.tags, "Name")}"
}
output "region" {
  value = var.region
}
