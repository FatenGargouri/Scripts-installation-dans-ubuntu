#!/bin/bash

# Télécharger Apache JMeter 5.6.3
wget https://downloads.apache.org//jmeter/binaries/apache-jmeter-5.6.3.zip

# Extraire l'archive
unzip apache-jmeter-5.6.3.zip

# Afficher la version de JMeter
./apache-jmeter-5.6.3/bin/jmeter --version

# Lancer JMeter
./apache-jmeter-5.6.3/bin/jmeter

