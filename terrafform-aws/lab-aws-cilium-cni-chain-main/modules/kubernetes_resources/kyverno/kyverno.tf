resource "kubernetes_namespace" "kyverno_namespace" {
  count  = "${var.kyverno ? 1 : 0}"
  metadata {
    name = "kyverno"
  }
  lifecycle { 
    create_before_destroy = false
    ignore_changes        = all
  }
}
resource "helm_release" "kyverno" {
  count       = "${var.kyverno ? 1 : 0}"
  name        = "kyverno"
  namespace   = "kyverno"
  repository  = "https://kyverno.github.io/kyverno"
  chart       = "kyverno"
  
  set {
    name  = "replicaCount"
    value = "1"
  }
 
}
