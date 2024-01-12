#!/bin/bash

# Download Eclipse IDE Installer for Linux
wget https://mirror.umd.edu/eclipse/oomph/products/latest/eclipse-inst-jre-linux64.tar.gz

# Extract the installer
tar -xvf eclipse-inst-jre-linux64.tar.gz

# Navigate to the installer directory
cd eclipse-installer/

# Run the installer
./eclipse-inst

# Cleanup - remove the downloaded archive
cd ..
rm -r eclipse-installer/
rm eclipse-inst-jre-linux64.tar.gz

echo "Eclipse IDE has been installed successfully!"
