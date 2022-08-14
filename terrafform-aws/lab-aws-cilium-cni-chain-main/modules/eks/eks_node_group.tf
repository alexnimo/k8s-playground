resource "aws_eks_node_group" "node-ec2" {
  cluster_name       = aws_eks_cluster.eks-cluster-lab.name
  node_group_name    = "t3_micro-node_group-${var.tags}"
  node_role_arn      = aws_iam_role.NodeGroupRole.arn
  subnet_ids         = var.subnet_ids
  
  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }
  ami_type       = var.ami_type
  instance_types = [var.instance_types]
  capacity_type  = var.capacity_type
  disk_size      = 20

  tags = {
    Name = "Node-${var.tags}"
 }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
}
