variable "driver" {
  description = "The driver to use for the Minikube cluster"
  type        = string
}

variable "cluster_name" {
  description = "The name of the Minikube cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "The version of Kubernetes to use"
  type        = string
}

variable "addons" {
  description = "List of Minikube addons to enable"
  type        = list(string)
}
