output "cluster_name" {
  description = "The name of the created Minikube cluster"
  value       = minikube_cluster.docker.cluster_name
}

output "host" {
  description = "The host address of the Kubernetes cluster"
  value       = minikube_cluster.docker.host
}

output "client_certificate" {
  description = "Client certificate for cluster authentication"
  value       = minikube_cluster.docker.client_certificate
  sensitive   = true
}

output "client_key" {
  description = "Client key for cluster authentication"
  value       = minikube_cluster.docker.client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Cluster CA certificate"
  value       = minikube_cluster.docker.cluster_ca_certificate
  sensitive   = true
}