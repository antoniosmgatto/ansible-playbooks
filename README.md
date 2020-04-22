Rails + Ansible Playbooks
=====

Ansible playbooks to handle a small server setup to running a rails application.

python: 3.7.7
ansible: 2.9.7

Vagrant instructions

TODO

### Tips

Running commands on all servers in a group

```bash
  ansible multi -i test -a "hostname"
```

Getting information about the servers with setup module

```bash
  ansible multi -i test -m setup
```

Installing ntp package with apt module inline

```bash
  ansible multi -i test --become -m apt -a "name=ntp state=present"
```


Update roles/requirements.yml and run ./roles-update.yml to update the project roles from Galaxy