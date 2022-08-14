resource "helm_release" "cilium" {
  name        = "cilium"
  namespace   = "kube-system"
  repository  = "https://helm.cilium.io"
  chart       = "cilium"
  version     = "1.11.5"
  
  set {
    name  = "cni.chainingMode"
    value = "aws-cni"
  }
  set {
    name  = "enableIPv4Masquerade"
    value = "false"
  }
  set {
    name  = "tunnel"
    value = "disabled"
  }
}
