#!/usr/bin/env bash

# Script to deploy private key to ansible controller

set -euo pipefail

PRIVATE_KEY_SOURCE="/vagrant/vagrant/.ssh/ansible_lab"
PRIVATE_KEY_DESTINATION="/home/vagrant/.ssh/ansible_lab"

echo "Configuring SSH access for ansible controller"

if [[ ! -f "$PRIVATE_KEY_SOURCE" ]]; then
  echo "ERROR: Private key not found at $PRIVATE_KEY_SOURCE"
  exit 1
fi

mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cp "$PRIVATE_KEY_SOURCE" "$PRIVATE_KEY_DESTINATION"
chmod 600 "$PRIVATE_KEY_DESTINATION"
chown -R vagrant:vagrant /home/vagrant/.ssh
