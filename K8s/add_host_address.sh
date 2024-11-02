#!/bin/bash

# Prompt user for Minikube cluster IP if IP_ADDRESS is not already set
if [[ -z "$IP_ADDRESS" ]]; then
    read -p "Enter the IP address of the Minikube cluster for hextris-prod.local: " IP_ADDRESS
fi

echo " "
# Exit if no IP address was entered
if [[ -z "$IP_ADDRESS" ]]; then
    echo "No IP address entered. Exiting."
    exit 1
fi

echo " "
# Define the host entry
HOST_ENTRY="$IP_ADDRESS hextris-prod.local"

echo " "
# Check if hextris-prod.local already exists in /etc/hosts, and add it if not
if ! grep -q "hextris-prod.local" /etc/hosts; then
    echo "Adding hextris-prod.local to /etc/hosts with IP $IP_ADDRESS..."
    echo "$HOST_ENTRY" | sudo tee -a /etc/hosts > /dev/null
else
    echo "hextris-prod.local is already present in /etc/hosts."
fi

echo " "
# Show the entry in the /etc/hosts file 

echo " "
sudo cat /etc/hosts | grep "hextris-prod.local"

echo "Host has been added to the file."
