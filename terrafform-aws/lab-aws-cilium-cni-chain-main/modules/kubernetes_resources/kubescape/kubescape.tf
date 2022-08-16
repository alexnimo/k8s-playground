resource "kubernetes_namespace" "kubescape_namespace" {
  count  = "${var.kubescape ? 1 : 0}"
  metadata {
    name = "kubescape"
  }
  lifecycle { 
    create_before_destroy = false
    ignore_changes        = all
  }
}
resource "helm_release" "kubescape" {
  count       = "${var.kyverno ? 1 : 0}"
  name        = "kubescape"
  namespace   = "kubescape"
  repository  = "https://armosec.github.io/armo-helm/"
  chart       = "armo-cluster-components"
  
  values    =  [
        "${file("${path.module}/values.yaml")}"
  ]

  set {
    name = "accountGuid"
    value = "${var.kubescape_account_guid}"
  }
 
}
