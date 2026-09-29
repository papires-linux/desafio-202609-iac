output "grafana_admin_password" {
  description = "Senha administrativa gerada automaticamente para o Grafana"
  value       = random_password.grafana_admin.result
  sensitive   = true
}

