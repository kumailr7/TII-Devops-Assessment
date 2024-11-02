terraform {
  required_providers {
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "~> 0.4.2"
    }
  }
}

resource "minikube_cluster" "docker" {
  driver       = var.driver
  cluster_name = var.cluster_name
  addons       = var.addons
}