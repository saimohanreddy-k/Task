#!/bin/bash

# Update the package list
sudo apt update

# Install Apache2
sudo apt install apache2 -y

# Create a basic HTML file as homepage
echo "<h1>Welcome to EC2 Apache Server - Always On!</h1>" | sudo tee /var/www/html/index.html

# Enable Apache2 to start on every server reboot
sudo systemctl enable apache2

# Create a systemd override directory for Apache2
sudo mkdir -p /etc/systemd/system/apache2.service.d

# Create override.conf to auto-restart Apache2 if it fails
cat <<EOF | sudo tee /etc/systemd/system/apache2.service.d/override.conf
[Service]
Restart=always
RestartSec=5
EOF

# Reload systemd to apply changes
sudo systemctl daemon-reload

# Restart Apache2 to ensure everything works
sudo systemctl restart apache2

