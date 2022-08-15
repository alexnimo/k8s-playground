locals {
  argocd_password = var.argocd_password == "" ? "" : bcrypt(var.argocd_password)
}
resource "kubernetes_namespace" "argocd_namespace" {
  count  = "${var.argocd ? 1 : 0}"
  metadata {
    name = "argocd"
  }
  lifecycle { 
    create_before_destroy = false
    ignore_changes        = all
  }
}
resource "helm_release" "argocd" {
  count       = "${var.argocd ? 1 : 0}"
  name        = "argo-cd"
  namespace   = "argocd"
  repository  = "https://argoproj.github.io/argo-helm"
  chart       = "argo-cd"
  
  values    =  [
        "${file("${path.module}/values-overide.yaml")}"
  ]
  set {
    name  = "server.service.type"
    value = "NodePort"
  }
  set {
    name  = "configs.secret.argocdServerAdminPassword"
    value = local.argocd_password
  }
  lifecycle { 
    create_before_destroy = false
    ignore_changes        = all
  }
}
