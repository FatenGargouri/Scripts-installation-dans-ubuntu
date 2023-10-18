#!/bin/bash

# Update package repository
sudo apt update

# Add Jenkins repository and its GPG key
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update package repository
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins to start on boot
sudo systemctl enable jenkins

# Check Jenkins service status
sudo systemctl status jenkins

# Open port 8080 in the firewall
sudo ufw allow 8080

# Retrieve the initial administrator password
JENKINS_ADMIN_PASSWORD=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)

# Print the initial administrator password
echo "Initial Administrator Password: $JENKINS_ADMIN_PASSWORD"

# Provide instructions for the user
echo "Jenkins is now installed and running on your server."
echo "To complete the setup, open a web browser and navigate to:"
echo "http://your_server_ip_or_domain:8080"
echo "Enter the administrator password when prompted and follow the Jenkins setup wizard."

