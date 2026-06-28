#!/usr/bin/env bash
set -euo pipefail

cd /vagrant
mkdir -p evidence
# Run the validation playbook and store the output in a file for later analysis
ansible-playbook -i ansible/inventory-001.ini ansible/validate-001.yml | tee evidence/validation-001-output.txt