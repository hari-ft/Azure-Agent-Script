#!/bin/sh

# Install required packages
pkg install -y curl bash sudo git

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
