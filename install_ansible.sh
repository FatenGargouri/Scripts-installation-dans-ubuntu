#!/bin/bash

# Update the package list and install dependencies
sudo apt update
sudo apt install -y software-properties-common

# Add the Ansible repository
sudo add-apt-repository ppa:ansible/ansible -y

# Update the package list again
sudo apt update

# Install Ansible
sudo apt install -y ansible

# Verify the installation
ansible --version
