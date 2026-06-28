# 001-rocky-ansible-bootstrap

## Ongoing Work

What is missing or incomplete:
git 
| Architecture         | Header exists, but empty | Add the two-VM model, roles, and private IP plan.                                                              |
                                               |
| Build Workflow       | Header exists, but empty | Add placeholder workflow: clone, validate tools, `vagrant up`, SSH, Ansible test.                              |
| Validation Plan      | Header exists, but empty | Add expected validation checks before implementation.                                                          |
                                                                  |

## Project Scope

This project establishes the first repeatable local lab environment for the cloud security engineering portfolio. It uses Vagrant and Oracle VirtualBox to deploy two Rocky Linux 9 virtual machines: an Ansible controller and a managed node.

The project focuses on foundational Linux administration, SSH-based management, private networking, Ansible inventory, baseline playbook execution, and validation evidence.

## Initial Objectives

- Deploy two Rocky Linux 9 virtual machines with Vagrant and VirtualBox.
- Configure one VM as an Ansible controller.
- Configure one VM as an Ansible managed node.
- Establish private network connectivity between the two machines.
- Validate SSH access from the controller to the managed node.
- Run Ansible ad hoc commands and a baseline playbook.
- Document build steps, validation evidence, and lessons learned.

## Dependencies

- Windows 11  
- VirtualBox 7.2.6
- Vagrant
- Visual Studio Code  
- Updated `Guest Additions`
- Git  
  
## Repository Structure

001-ROCKY-ANSIBLE-BOOTSTRAP
├── ansible/
│   ├── baseline-001.yml
│   └── inventory-001.ini
├── scripts/
│   ├── bootstrap-ansible-controller.sh
│   └── deploy-public-key.sh
├── vagrant/.ssh
│   ├── ansible_lab
│   └── ansible_lab.pub
├── README.md
├── .gitignore
└── Vagrantfile

## Project Architecture

## Build and Validation Workflow

This workflow explains how to build the lab and validate each major capability. The goal is to prove that the local Vagrant environment, VirtualBox virtual machines, private networking, Ansible controller bootstrap, and Ansible inventory are working as expected.

### 1. Validate the Vagrantfile

Run this command from the repository root before creating or modifying virtual machines.

```powershell
vagrant validate
```

Expected result:

```text
Vagrantfile validated successfully.
```

This confirms that the Vagrant configuration is syntactically valid before any VM changes are made.

### 2. Start the lab environment

Create and start the Rocky Linux virtual machines.

```powershell
vagrant up
```

This should create the following lab systems:

| VM Name            | Role                 |    Private IP | Resources           |
| ------------------ | -------------------- | ------------: | ------------------- |
| ansible-controller | Ansible control node | 192.168.56.10 | 2 CPU / 2048 MB RAM |
| managed-node-01    | Ansible managed node | 192.168.56.11 | 1 CPU / 1024 MB RAM |

Successful completion confirms that Vagrant and VirtualBox can create both virtual machines.

### 3. Confirm VM status

Verify that both machines are running.

```powershell
vagrant status
```

Expected result:

```text
ansible-controller    running
managed-node-01       running
```

This confirms that both virtual machines exist and are active.

### 4. Access the Ansible controller

Connect to the controller VM.

```powershell
vagrant ssh ansible-controller
```

Successful login confirms that the controller VM is reachable through Vagrant-managed SSH.

### 5. Validate Ansible controller bootstrap

From inside the controller VM, confirm that Ansible is installed.

```bash
ansible --version
```

Successful output confirms that the controller bootstrap script completed and Ansible is available to the `vagrant` user.

### 6. Validate private network connectivity

From inside the controller VM, test connectivity to the managed node.

```bash
ping -c 4 192.168.56.11
```

Expected result:

```text
4 packets transmitted, 4 received, 0% packet loss
```

This confirms that the private host-only network between the controller and managed node is working.

### 7. Validate Ansible inventory

From inside the controller VM, confirm that Ansible can read the inventory file.

```bash
ansible-inventory -i /vagrant/ansible/inventory-001.ini --list
```

Successful output confirms that the inventory file is valid and that Ansible can parse the managed node definition.

### 8. Test Ansible communication with the managed node

Run an Ansible ping test against the managed node.

```bash
ansible managed -i /vagrant/ansible/inventory-001.ini -m ping
```

Expected result:

```text
managed-node-01 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

This confirms that the Ansible controller can reach and manage the target node over SSH.

## Security Notes

This project does not implement hardening. Later projects will introduce OpenSCAP, STIG-aligned baselines, hardening roles, validation evidence, and exception documentation.

