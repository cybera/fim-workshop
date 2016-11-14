# Setup IdP

## Pre-config work

### Update inventory file
```
vi inventory
```

### Update variable file
```
vi group_vars/idp.yml
```


## Run playbook
```
ansible-playbook -i inventory setup_idp.yml
```
