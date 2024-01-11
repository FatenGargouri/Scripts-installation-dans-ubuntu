#!/bin/bash

# Variables
TERRAFORM_VERSION="0.15.0"  # Change this to the desired Terraform version
TERRAFORM_DOWNLOAD_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

# Download and install Terraform
echo "Downloading Terraform ${TERRAFORM_VERSION}..."
wget -q "$TERRAFORM_DOWNLOAD_URL" -O terraform.zip

echo "Extracting Terraform..."
unzip -o terraform.zip -d /usr/local/bin

# Cleanup
rm terraform.zip

# Verify installation
echo "Terraform installation complete!"
terraform --version
