resource "aws_security_group_rule" "cluster_inbound" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_eks_cluster.eks-cluster-lab.vpc_config[0].cluster_security_group_id
  source_security_group_id = aws_security_group.eks_nodes.id
  to_port                  = 0
  type                     = "ingress"
}
