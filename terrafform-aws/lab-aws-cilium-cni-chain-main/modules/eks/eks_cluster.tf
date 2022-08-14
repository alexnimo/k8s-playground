resource "aws_eks_cluster" "eks-cluster-lab" {
  name     = "EKS-${var.tags}"
  role_arn = "${aws_iam_role.EKSClusterRole.arn}"
  version  = "1.22"
  
  vpc_config {
    subnet_ids              = var.subnet_ids
    security_group_ids      = [aws_security_group.allow_cluster_access.id]
    endpoint_private_access = true
    endpoint_public_access  = true
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSServicePolicy,
  ]
}
