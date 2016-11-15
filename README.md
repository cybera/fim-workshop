# Setting up an IdP (SimpleSAMLphp) and SP (DokuWiki)

## Prerequisites for this workshop

- Ansible: `pip install ansible`
- OpenStack Nova: `pip install python-novaclient`
- Terraform: https://www.terraform.io/
- Openstack openrc.sh file 

### Create instances
```
source ~/openrc.sh
terraform apply
```

### Get DNS entries for instances
```
nova show fim-workshop-idp |grep dns
nova show fim-workshop-dokuwiki |grep dns
```
### Update inventory file
```
[idp]
<idp_dns>.yeg.cybera.ca

[dokuwiki]
<dokuwiki_dns>.yeg.cybera.ca
```

### Update variable file
```
vi group_vars/idp.yml
```


## Run playbooks
```
ansible-playbook -i inventory setup_idp.yml
ansible-playbook -i inventory setup_dokuwiki.yml
```

## Test metadata
```
curl https://<idp_dns>/simplesaml/saml2/idp/metadata.php
curl https://<dokuwiki_dns>/Shibboleth.sso/Metadata
```
