variable "argocd" {
  type = bool
}
variable "argocd_password" {}
variable "tags" {}
variable "subnets" {}
variable "vpc_id" {}
variable "cluster_name" {}
/*variable "argocd-values" {
  type = list
  default = "${file("${path.module}/values-overide.yaml")}"
}*/
variable "amount_instances" {
  description = "number of worker nodes"
  default     = "2"
}
