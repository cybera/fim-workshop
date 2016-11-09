#!/bin/sh
ansible-playbook -v \
    -i "environments/workshop/inventory" \
    -u "centos" \
    --extra-vars="secrets_file=environments/workshop/secrets/workshop.yml" \
    -K provision-vm.yml \
