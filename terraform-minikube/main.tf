terraform {
  required_providers {
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "~> 0.4.2"
    }
  }
}

provider "minikube" {
  kubernetes_version = var.kubernetes_version
}

module "minikube_cluster" {
  source       = "./modules/minikube_cluster"
  driver       = var.driver
  cluster_name = var.cluster_name
  addons       = var.addons
}