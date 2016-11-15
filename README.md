# Setup IdP

## Pre-config work

### Get DNS entries for instances
```
nova show fim-workshop-idp |grep dns
nova show fim-workshop-dokuwiki |grep dns
```
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
