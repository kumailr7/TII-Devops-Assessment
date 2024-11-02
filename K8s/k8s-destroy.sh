#!/bin/bash

### Prompt for Namespace or Set Default
NAMESPACE=${NAMESPACE:-$(read -p "Enter the namespace to create [default: hextris]: " ns && echo "${ns:-hextris}")}

echo " "
### Delete the application 


kubectl delete -f deployment.yml -n $NAMESPACE
kubectl delete -f services.yml -n $NAMESPACE
kubectl delete -f ingress.yml -n $NAMESPACE
kubectl delete -f secrets.yml -n $NAMESPACE

echo " "

echo "Application has been removed from namespace"