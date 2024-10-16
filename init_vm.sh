#!/bin/bash

set -ex

source /vagrant/.ssh_env

apt update
apt install ssh -y
echo -e "nameserver 8.8.8.8\nnameserver 1.1.1.1" | sudo tee /etc/resolv.conf

echo $SSH_KEY >> /home/vagrant/.ssh/authorized_keys

sudo sed -i 's/^#PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config

mkdir -p /root/.ssh
cp /home/vagrant/.ssh/authorized_keys /root/.ssh/
chmod 700 /root/.ssh
chmod 600 /root/.ssh/authorized_keys

sudo systemctl restart ssh
