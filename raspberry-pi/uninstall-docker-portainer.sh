#!/bin/bash
# Uninstall Docker and Portainer from Raspberry Pi

# Stop and remove Portainer container
echo "Stopping and removing Portainer container..."
sudo docker stop portainer && sudo docker rm portainer

# Remove Portainer data volume
echo "Removing Portainer data volume..."
sudo docker volume rm portainer_data

# Stop Docker service
echo "Stopping Docker service..."
sudo systemctl stop docker
sudo systemctl disable docker

# Remove Docker packages
echo "Removing Docker packages..."
sudo apt purge -y docker-ce docker-ce-cli containerd.io
sudo apt autoremove -y

# Remove Docker files and directories
echo "Removing Docker files and directories..."
sudo rm -rf /var/lib/docker
sudo rm -rf /etc/docker
sudo rm -rf /etc/apt/sources.list.d/docker.list
sudo rm -rf /usr/share/keyrings/docker-archive-keyring.gpg

# Print completion message
echo "Docker and Portainer have been removed from your Raspberry Pi."
echo "A system reboot is recommended."