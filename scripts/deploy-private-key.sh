#/usr/bin/env bash

#!/usr/bin/env bash

# Script to deploy private key to ansible controller

set -euo pipefail

PRIVATE_KEY_SOURCE="/vagrant/vagrant/.ssh/ansible_lab"
AUTHORIZED_KEYS="/home/vagrant/.ssh/authorized_keys"

echo "Configuring SSH access for ansible controller"

mkdir -p /home/vagrant/.ssh
cp "$PRIVATE_KEY_SOURCE" /home/vagrant/.ssh/id_rsa
chmod 600 /home/vagrant/.ssh/id_rsa
chown -R vagrant:vagrant /home/vagrant/.ssh
