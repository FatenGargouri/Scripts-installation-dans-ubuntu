#!/bin/bash

# Update the package list and install required packages
sudo apt update
sudo apt-get install -y ca-certificates curl gnupg

# Create the keyring directory and add Docker's GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Add the Docker repository to APT sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list again with the Docker repository
sudo apt update

# Install Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Install Docker Compose
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

# Start and enable the Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Verify the Docker and Docker Compose installations
docker --version
docker compose --version

# Output a message for the user
echo "Docker and Docker Compose are now installed. You may need to log out and back in or restart your system for group membership changes to take effect."

