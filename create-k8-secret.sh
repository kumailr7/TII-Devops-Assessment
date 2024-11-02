#!/bin/bash

# Define the output directory for Kubernetes manifests
K8S_DIR="K8s"

# Create the directory if it doesn't exist
mkdir -p "$K8S_DIR"

# Create the secret manifest and move it to the K8s directory
cat << EEOF > "$K8S_DIR/secrets.yml"
apiVersion: v1
kind: Secret
metadata:
  name: hextris-tls-secret
  namespace: hextris
type: kubernetes.io/tls
data:
  tls.crt: $(cat hextris-prod.local.pem | base64 -w 0)
  tls.key: $(cat hextris-prod.local-key.pem | base64 -w 0)
EEOF

echo "Secret manifest created and moved to $K8S_DIR/secrets.yml"


