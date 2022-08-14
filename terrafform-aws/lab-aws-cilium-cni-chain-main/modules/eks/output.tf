output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       =  aws_eks_cluster.eks-cluster-lab.endpoint
}
output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = try(aws_eks_cluster.eks-cluster-lab.certificate_authority[0].data)
}
output "eks_cluster_name" {
  description = "EKS Cluster Name"
  value       = aws_eks_cluster.eks-cluster-lab.name
}
output "iam_role_NodeGroupRole_arn" {
  description = "Nodes role arn"
  value       = aws_iam_role.NodeGroupRole.arn
}
