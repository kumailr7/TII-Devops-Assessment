#!/bin/bash 

### Prompt for Namespace or Set Default
NAMESPACE=${NAMESPACE:-$(read -p "Enter the namespace to create [default: hextris]: " ns && echo "${ns:-hextris}")}

# Check if hextris-prod.local entry already exists in /etc/hosts
source  add_host_address.sh

### Creating Hextris Namespace
echo "Creating Namespace: $NAMESPACE"
echo " "
kubectl create namespace $NAMESPACE

### Wait for the ingress controller to be ready

echo " "
echo "Checking ingress controller to be ready"
echo  " "
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s

echo " "
#### Deploy the application 

kubectl apply -f deployment.yml -n $NAMESPACE
kubectl apply -f services.yml -n $NAMESPACE
kubectl apply -f ingress.yml -n $NAMESPACE
kubectl apply -f secrets.yml -n $NAMESPACE
echo " "
#### Check the applications status 

kubectl get all -n $NAMESPACE

kubectl get ing -n $NAMESPACE

echo " "
#### Ping the local domain 

ping -c 3 hextris-prod.local

echo " "

# Add a delay to allow the service to become available
echo "Waiting for the service to be ready..."
sleep 5  # Adjust the delay as needed (e.g., 5 seconds)

# Check the status of the site using curl
HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}" https://hextris-prod.local)

if [[ "$HTTP_STATUS" -eq 200 ]]; then
    echo "Site is up and reachable with status 200 OK."
else
    echo "Site returned status $HTTP_STATUS. It may still be starting up or there may be an issue."
fi
