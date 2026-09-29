resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  namespace        = "argocd"
  create_namespace = true

  values = [
    yamlencode({
      server = {
        service = {
          type = "LoadBalancer"
        }

        extraArgs = [
          "--insecure"
        ]
      }

      configs = {
        params = {
          "server.insecure" = true
        }
      }
      resources = {
        requests = {
          cpu    = "250m"
          memory = "512Mi"
        }

        limits = {
          cpu    = "1000m"
          memory = "1Gi"
        }
      }
    })
  ]
}