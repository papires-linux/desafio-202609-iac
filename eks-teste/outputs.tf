output "grafana_admin_password" {
  description = "Senha administrativa do Grafana"
  value       = module.pods.grafana_admin_password
  sensitive   = true
}
