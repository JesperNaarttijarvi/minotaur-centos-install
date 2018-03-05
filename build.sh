#!/bin/bash
# 
yum -y install python-pip 
pip install ansible
ansible-playbook -i 'localhost,' -c local playbooks/server.yml