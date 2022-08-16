variable "kubescape" {
  type = bool
}

variable "kubescape_account_guid" {
  
  type = string
  sensitive = true
}

variable "eks_cluster.name" {}
