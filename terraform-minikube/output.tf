output "cluster_name" {
  description = "The name of the created Minikube cluster"
  value       = module.minikube_cluster.cluster_name
}

output "host" {
  description = "The host address of the Kubernetes cluster"
  value       = module.minikube_cluster.host
}

output "client_certificate" {
  description = "Client certificate for cluster authentication"
  value       = module.minikube_cluster.client_certificate
  sensitive   = true
}

output "client_key" {
  description = "Client key for cluster authentication"
  value       = module.minikube_cluster.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Cluster CA certificate"
  value       = module.minikube_cluster.cluster_ca_certificate
  sensitive   = true
}