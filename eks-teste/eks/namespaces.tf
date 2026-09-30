# Primeiro Namespace (Ex: Homologacao)
resource "kubernetes_namespace_v1" "homo" {
  metadata {
    name = "homo"
    labels = {
      environment = "Homologacao"
      managed-by  = "terraform"
    }
  }
}

# Segundo Namespace (Ex: Produção)
resource "kubernetes_namespace_v1" "prod" {
  metadata {
    name = "prod"
    labels = {
      environment = "producao"
      managed-by  = "terraform"
    }
  }
}


