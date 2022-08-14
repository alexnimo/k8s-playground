output "argocd_access_url" {
  value = "https://${var.argocd ? aws_lb.argocd_nlb[0].dns_name : ""}"
}
