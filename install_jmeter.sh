#!/bin/bash

# Check if the user has superuser privileges
if [[ "$EUID" -ne 0 ]]; then
  echo "This script needs superuser privileges. Please run it as root or using sudo."
  exit 1
fi

# Update package list
apt update

# Install JMeter
apt install -y jmeter

# Check if JMeter installation was successful
if [ $? -eq 0 ]; then
  echo "JMeter has been successfully installed."
else
  echo "JMeter installation failed."
fi

# Display JMeter version
jmeter -v

# Exit the script
exit 0
