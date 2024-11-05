#!/bin/sh
sudo pkg update
sudo pkg install git
ln -sf /usr/local/bin/python3 /usr/local/bin/python
git clone https://github.com/Azure/WALinuxAgent.git
cd WALinuxAgent
python3 setup.py install --register-service
sysrc waagent_enable="YES"
service waagent start
sleep 10
service waagent status
