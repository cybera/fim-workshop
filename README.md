# Setting up an IdP (SimpleSAMLphp) and SP (DokuWiki)

## Prerequisites for this workshop

- Ansible: `pip install ansible`
- OpenStack Nova: `pip install python-novaclient`
- Terraform: https://www.terraform.io/
- Openstack openrc.sh file 

### Create instances
```
source openrc.sh
<enter OpenStack username/password when prompted>
terraform apply
```

### Update variable file
```
vi group_vars/idp.yml
```


## Run playbooks
```
ansible-playbook setup_idp.yml
ansible-playbook setup_dokuwiki.yml
```

## Test metadata
```
curl https://<idp_dns>/simplesaml/saml2/idp/metadata.php
curl https://<dokuwiki_dns>/Shibboleth.sso/Metadata
```
