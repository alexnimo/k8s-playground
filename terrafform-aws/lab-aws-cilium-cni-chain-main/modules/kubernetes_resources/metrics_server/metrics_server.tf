resource "helm_release" "metrics_server" {
  count       = "${var.metrics_server ? 1 : 0}"
  name        = "metrics-server"
  namespace   = "kube-system"
  repository  = "https://kubernetes-sigs.github.io/metrics-server"
  chart       = "metrics-server"
  
  set {
    name  = "replicas"
    value = "2"
  }
}
