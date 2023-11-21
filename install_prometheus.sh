#!/bin/bash

# Installation de Prometheus
sudo apt-get -y install prometheus

# Affichage de la version de Prometheus
prometheus --version

# Vérification du statut de Prometheus
sudo systemctl status prometheus

# Autorisation du port 9090 dans le pare-feu UFW
sudo ufw allow 9090/tcp

# Arrêt de Prometheus (si déjà en cours d'exécution)
sudo systemctl stop prometheus

# Démarrage de Prometheus
sudo systemctl start prometheus

# Vérification du statut de Prometheus après le démarrage
sudo systemctl status prometheus
