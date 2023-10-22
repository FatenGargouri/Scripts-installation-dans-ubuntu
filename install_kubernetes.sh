#!/bin/bash

# Vérifiez si Docker est installé, car Minikube dépend de Docker.
if ! command -v docker &> /dev/null; then
  echo "Docker n'est pas installé. Veuillez installer Docker avant de continuer."
  exit 1
fi

sudo usermod -aG docker faten


# Télécharge Minikube
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
chmod +x minikube
sudo mv minikube /usr/local/bin/

# Télécharge kubectl
curl -Lo kubectl https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x kubectl
sudo mv kubectl /usr/local/bin/


# Start Minikube with the Docker driver
minikube start --vm-driver=docker

# Vérifiez que Minikube est correctement installé
minikube status

