variable "argocd" {
  type = bool
}
variable "argocd_password" {}
variable "tags" {}
variable "subnets" {}
variable "vpc_id" {}
variable "cluster_name" {}
variable "amount_instances" {
  description = "number of worker nodes"
  default     = "2"
}
