#!/bin/bash

# Create directory with correct spacing
sudo mkdir -p /etc/venkey

# Update system
yum update -y

# Install Nginx
amazon-linux-extras enable nginx1
yum install -y nginx

# Start and enable Nginx
systemctl start nginx
systemctl enable nginx

# Write hostname and welcome message to index.html
echo "<div style='text-align: center; font-family: Arial, sans-serif;'>
        <h1>Welcome to the Server</h1>
        <h2>Hostname: $(hostname)</h2>
      </div>" > /usr/share/nginx/html/index.html

# Restart Nginx to apply changes
systemctl restart nginx
