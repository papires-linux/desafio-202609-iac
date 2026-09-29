resource "random_password" "grafana_admin" {
  length           = 24
  special          = true
  override_special = "!@#$%&*-_"
}

resource "helm_release" "kube_prometheus_stack" {
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  namespace        = "monitoring"
  create_namespace = true

  values = [
    yamlencode({
      grafana = {
        enabled = true
        adminPassword = random_password.grafana_admin.result
        service = {
          type = "LoadBalancer"
        }
      }

      prometheus = {
        prometheusSpec = {
          retention = "7d"
        }
      }

      alertmanager = {
        enabled = true
      }
    })
  ]
}