# Ansible playbooks

Ansible playbooks to setup Debian 10 (Buster) servers.

This repo has the following playbooks:

- common.yml

  Generic setup with security concerns (install basic packages and setup apt, dns, firewall, ssh, sudo, swap, timezone )

## Requirements

- Python: 3.7
- Ansible: 2.9+
- Virtualbox

## Instalation

### Downloading roles

Run `./update-galaxy-roles.sh` to download the roles from [Galaxy](https://galaxy.ansible.com/).

### Vault secret

Create the file `.vault_pass.txt` at the root of the project with
your secret.

## Tests

This project is configure with [Vagrant](https://www.vagrantup.com/) for tests.

```bash
  # to startup the server
  vagrant up

  # use '-i test' to set the inventory to use vagrant environment
  ansible-playbook -i test plays/common.yml
```

Some useful commands:

```bash
  # to connect by ssh with vm
  vagrant ssh

  # to destroy the vm
  vagrant destroy
```

## Licence

MIT
