#!/bin/sh
# Update the pkg repository
echo "Updating package repository..."
pkg update
# Upgrade installed packages
echo "Upgrading installed packages..."
pkg upgrade -y
# Install required packages
pkg install -y git
# Create symlink for Python if not already present
ln -sf /usr/local/bin/python3 /usr/local/bin/python
# Clone the WALinuxAgent repository
git clone https://github.com/Azure/WALinuxAgent.git
# Navigate to the WALinuxAgent directory
cd WALinuxAgent
# Install WALinuxAgent and register it as a service
python3 setup.py install --register-service
# Enable the waagent service
sysrc waagent_enable="YES"
# Start the waagent service
service waagent start
# Wait for 10 seconds before checking the status
sleep 10
# Check the status of waagent service
service waagent status
