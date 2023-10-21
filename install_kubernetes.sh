#!/bin/bash

apt-get update
apt-get install -y apt-transport-https ca-certificates curl 

swapoff -a  <<<<<<<< just disable it in /etc/fstab instead


curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list"

apt-get update


sudo -s

apt-get install -y kubelet=1.26.1-00 kubeadm=1.26.1-00 kubectl=1.26.1-00
apt-mark hold kubelet kubeadm kubectl

# check swap config, ensure swap is 0
free -m


### ONLY ON CONTROL NODE .. control plane install:
kubeadm init --pod-network-cidr 10.10.0.0/16 --kubernetes-version 1.26.1 --node-name k8s-control


# add Calico 3.25 CNI 
### https://docs.tigera.io/calico/3.25/getting-started/kubernetes/quickstart
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/tigera-operator.yaml
wget https://raw.githubusercontent.com/projectcalico/calico/v3.25.0/manifests/custom-resources.yaml
vi custom-resources.yaml <<<<<< edit the CIDR for pods if its custom
kubectl apply -f custom-resources.yaml

# get worker node commands to run to join additional nodes into cluster
kubeadm token create --print-join-command


## ONLY ON WORKER nodes
Run the command from the token create output above... this script for installing kubernetes successfully ?
