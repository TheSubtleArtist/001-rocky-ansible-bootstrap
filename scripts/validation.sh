#!/usr/bin/env bash
set -euo pipefail

cd /vagrant
mkdir -p evidence
ANSIBLE_NOCOLOR=1 ansible-playbook -i ansible/inventory-001.ini ansible/validate-001.yml | tee evidence/validation-001-output.txt