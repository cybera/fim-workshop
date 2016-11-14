Ansible role for SSP Multi-Tenancy LDAP Install
===================================


Role Variables
--------------

```
# Defaults for ssp_idp_config
ssp_idp_technical_email: "na@example.org"
ssp_idp_technical_name: "Administrator"

# Timezone from http://php.net/manual/en/timezones.php
ssp_idp_timezone: America/Edmonton

ssp_idp_admin_password: admin
ssp_idp_secretsalt: defaultsecretsalt
ssp_idp_storetype: memcache

ssp_idp_storetype_sqldsn: 'sqlite:/tmp/ssp.sq3'

ssp_idp_openconext_sp_meta_url: https://openconext.example.com/authentication/sp/metadata
ssp_idp_openconext_sp_assert_url: https://openconext.example.com/authentication/sp/consume-assertion

# Prompt for attribute release consent
ssp_idp_attr_consent: true

# Sources to use for IdP configurations below
ssp_idp_authsources:
  - auth_name: example-ad
    hostname: ad.example.com
    enable_tls: False
    search_base:
      - 'CN=Users,DC=example,DC=com'
    username: CN=User1,DC=example,DC=com
    password: ThisIsNotAStrongPassword
    filter: NULL

  - auth_name: example-ad2
    hostname: ad2.example.com
    enable_tls: True
    search_base:
      - 'CN=Users,DC=example,DC=com'
      - 'CN=ServiceAccounts,DC=example,DC=com'
    username: user@ad.example.com
    password: ThisIsNotAStrongPassword
    filter: '(&(objectCategory=Person)(ObjectClass=User))'

# IdP configurations. Limited to single auth source for now.
ssp_idp_configs:
  - domain: ssp.example.com
    ssl_subj: '/CN=ssp.example.com/O=Organization Name/C=CA'
    ssl_bits: 2048
    ssl_days: 3652
    auth_name: example-ad
    display_name: Example AD
    description: This is an Example AD
    logo_url: http://logo.example.com
    logo_height: 51
    logo_width: 107

  - domain: ssp2.example.com
    ssl_subj: '/CN=ssp2.example.com/O=Organization Name/C=CA'
    ssl_bits: 2048
    ssl_days: 3652
    auth_name: example-ad2
    display_name: Example AD2
    description: This is an Example AD2
    logo_url: http://logo2.example.com
    logo_height: 51
    logo_width: 107
```
Actions role
------------


How to install
--------------

    ansible-galaxy install cybera.ssp_idp_config

For more installation's options/variants read the documentation: http://docs.ansible.com/galaxy.html

Dependencies
------------

* cybera.ssp_install

Example Playbook
----------------

Example of usage with default parameters:

    - hosts: all
      roles:
         - cybera.ssp_idp_config

License
-------

GPLv2

Author Information
------------------

Andrew Klaus (Cybera)
