# 001-rocky-ansible-bootstrap

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

Yes. At this point, the README has the right foundation, but it is still missing several sections that should exist **before** we start adding the Vagrantfile.

What is already good:

The project scope is clear and correctly frames this as the first repeatable local lab environment using Vagrant, VirtualBox, and two Rocky Linux 9 VMs. It also correctly identifies the focus areas: Linux administration, SSH management, private networking, Ansible inventory, baseline playbooks, and validation evidence.

The initial objectives are also strong. They describe the actual technical milestones without overpromising STIG, Kubernetes, Terraform, AWS, or application deployment.

What is missing or incomplete:

| Section              |                   Status | Recommendation                                                                                                 |
| -------------------- | -----------------------: | -------------------------------------------------------------------------------------------------------------- |
| Repository Structure | Header exists, but empty | Add planned folders and their purpose.                                                                         |
| Architecture         | Header exists, but empty | Add the two-VM model, roles, and private IP plan.                                                              |
| Prerequisites        | Header exists, but empty | Add Windows 11, VirtualBox, Vagrant, Git, and PowerShell.                                                      |
| Build Workflow       | Header exists, but empty | Add placeholder workflow: clone, validate tools, `vagrant up`, SSH, Ansible test.                              |
| Validation Plan      | Header exists, but empty | Add expected validation checks before implementation.                                                          |
| Out of Scope         |                  Missing | Important. Prevents scope creep.                                                                               |
| Security Notes       |                  Missing | Important. Say full STIG hardening is not included yet, but Rocky/RHEL-family hardening is a future direction. |
| Learning Objectives  |                  Missing | Important for portfolio value. Explain what skill this repo proves.                                            |
| Current Status       |                  Missing | Useful while the repo is early and incomplete.                                                                 |
| License / Use        |                  Missing | Not urgent yet, but should eventually exist.                                                                   |

My blunt opinion: **the README is good enough as a project seed, but not yet good enough as a professional portfolio README.** That is fine because we are early. But before we write much code, we should add the missing scaffolding so the repo tells a reviewer where it is going.

The next README update should add this kind of structure:

````markdown
## Current Status

This repository is in the initial planning and scaffolding stage. The Vagrant and Ansible configuration files have not yet been added.

## Repository Structure

```text
.
├── README.md
├── .gitignore
├── Vagrantfile
├── ansible/
│   ├── inventory.ini
│   └── playbooks/
│       └── baseline.yml
├── docs/
│   ├── architecture/
│   ├── decisions/
│   ├── validation/
│   └── lessons-learned/
└── evidence/
````

## Architecture

This lab will deploy two Rocky Linux 9 virtual machines:

| Hostname           | Role         | Purpose                                    |
| ------------------ | ------------ | ------------------------------------------ |
| ansible-controller | Control node | Runs Ansible and manages the lab node      |
| managed-node-01    | Managed node | Receives configuration from the controller |

Both systems will use NAT for internet access and a private host-only network for lab communication.

## Security Notes

This project does not implement hardening. Later projects will introduce OpenSCAP, STIG-aligned baselines, hardening roles, validation evidence, and exception documentation.

