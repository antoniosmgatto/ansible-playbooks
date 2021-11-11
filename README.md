# Ansible playbooks

Ansible playbooks to setup Debian 10 (Buster) servers.

This repo has the following playbooks:

- common.yml

  Generic setup with security concerns (install basic packages and setup apt, dns, firewall, ssh, sudo, swap, timezone )

## Requirements

- Python: 3.9
- Ansible: 2.10
- Virtualbox

## Getting started

```shell
# install python packages
pip install -r ./requirements.txt

# download roles from Galaxy
./galaxy-update.sh

# create file with vault secret
echo "your-secret-here" > .vault_pass.txt

# create and setup your inventory
cp inventory.example production

# run playbook
 ansible-playbook -i production plays/common.yml
```

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
