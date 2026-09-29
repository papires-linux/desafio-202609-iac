terraform {
  required_version = ">= 1.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.99.1"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 2.0"
    }
  }

  backend "s3" {
    bucket  = "tf-000dff5b362a"
    key     = "picpay/proj-eks/terraform.tfstate" # Caminho e nome do arquivo dentro do bucket
    region  = "us-east-1"                         # Região do seu bucket
    encrypt = true                                # Garante que o estado será criptografado em repouso
  }
}

module "network" {
  source = "./network"

  aws_region   = var.aws_region
  project_name = var.project_name
}

module "eks" {
  source = "./eks"

  project_name    = var.project_name
  cluster_version = var.cluster_version
  environment     = var.environment

  vpc_id          = module.network.vpc_id
  private_subnets = module.network.private_subnets

  node_instance_types = var.node_instance_types
  node_min_size       = var.node_min_size
  node_max_size       = var.node_max_size
  node_desired_size   = var.node_desired_size
}

module "pods" {
  source = "./pods"

  depends_on = [
    module.eks
  ]
}