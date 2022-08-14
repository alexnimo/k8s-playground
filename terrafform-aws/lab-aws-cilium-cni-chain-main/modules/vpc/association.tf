resource "aws_route_table_association" "public_tables" {
  count          = var.az_count_public
  subnet_id      = element(aws_subnet.public_cidrs_az.*.id, count.index)
  route_table_id = element(aws_route_table.public_rt.*.id, count.index)
}
resource "aws_route_table_association" "private_tables" {
  count          = var.az_count_private
  subnet_id      = element(aws_subnet.private_cidrs_az.*.id, count.index)
  route_table_id = element(aws_route_table.private_rt.*.id, count.index)
}