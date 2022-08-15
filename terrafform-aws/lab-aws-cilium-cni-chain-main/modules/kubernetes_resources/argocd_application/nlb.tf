resource "aws_lb" "argocd_nlb" {
  count              = "${var.argocd ? 1 : 0}"
  name               = "argocd-nlb-${var.tags}"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.subnets

  enable_deletion_protection = false

  tags = {
    Name = var.tags
  }
}
resource "aws_lb_target_group" "argocd_target_group" {
  count    = "${var.argocd ? 1 : 0}"
  name     = "argocd-target-${var.tags}"
  port     = 443
  protocol = "TCP"
  vpc_id   = var.vpc_id
}
data "aws_instances" "node_groups" {
  instance_tags = {
    "eks:cluster-name" = var.cluster_name
  }
}
resource "aws_lb_target_group_attachment" "argocd__group_attachment" {
  count            = "${var.argocd ? 2 : 0}"
  target_group_arn = aws_lb_target_group.argocd_target_group[0].arn
  target_id        = data.aws_instances.node_groups.ids[count.index]
  port             = 30443
  
  depends_on = [data.aws_instances.node_groups]
}
resource "aws_lb_listener" "argocd_aws_lb_listener" {
  count             = "${var.argocd ? 1 : 0}"
  load_balancer_arn = aws_lb.argocd_nlb[0].arn
  port              = "443"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.argocd_target_group[0].arn
  }
}
