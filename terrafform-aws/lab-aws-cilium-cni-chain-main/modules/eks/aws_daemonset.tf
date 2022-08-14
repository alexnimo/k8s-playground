resource "null_resource" "aws_config_kubectl" {
  provisioner "local-exec" {
    command = "curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.2/2021-07-05/bin/linux/amd64/kubectl && chmod +x kubectl"
  }
  provisioner "local-exec" {
    command = "aws eks --region ${var.region} update-kubeconfig --name ${aws_eks_cluster.eks-cluster-lab.name}"
  }
  depends_on = [
    aws_eks_cluster.eks-cluster-lab]
}
resource "null_resource" "aws_daemonset" {
  provisioner "local-exec" {
    command = "./kubectl set env daemonset -n kube-system aws-node AWS_VPC_K8S_CNI_EXTERNALSNAT=true && ./kubectl set env daemonset aws-node -n kube-system ENABLE_PREFIX_DELEGATION=true"
  }
  depends_on = [
    null_resource.aws_config_kubectl]
}
