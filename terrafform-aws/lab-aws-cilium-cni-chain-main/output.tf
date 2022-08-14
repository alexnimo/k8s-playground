output "argocd_password" {
  description = "argo-cd admin password"
  value       = module.vpc.argocd_password
}
output "argocd_access_url" {
  description = "argo-cd https access"
  value       = module.argocd_application.argocd_access_url
}
