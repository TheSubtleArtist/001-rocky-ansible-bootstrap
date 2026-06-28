#!/usr/bin/env bash

set -euo pipefail

PUBLIC_KEY_SOURCE="/vagrant/vagrant/.ssh/ansible_lab.pub"
AUTHORIZED_KEYS="/home/vagrant/.ssh/authorized_keys"

echo "Configuring SSH access for managed node"

if [[ ! -f "$PUBLIC_KEY_SOURCE" ]]; then
  echo "ERROR: Public key not found at $PUBLIC_KEY_SOURCE"
  exit 1
fi

mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
touch "$AUTHORIZED_KEYS"

echo "Copying public key to managed node"
grep -qxF "$(cat "$PUBLIC_KEY_SOURCE")" "$AUTHORIZED_KEYS" || cat "$PUBLIC_KEY_SOURCE" >> "$AUTHORIZED_KEYS"

chmod 600 "$AUTHORIZED_KEYS"
chown -R vagrant:vagrant /home/vagrant/.ssh