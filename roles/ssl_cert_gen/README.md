ssl_cert_gen
=========

This role generates an x509 keypair if required.

Requirements
------------

Only requirement is openssl (and is installed by the playbook).

Role Variables
--------------
```
key_size: 4096 # RSA key size
digest: sha256  # digest type (https://www.openssl.org/docs/manmaster/apps/openssl.html)
crt_days_valid: 365  # Days for cert to be valid
crt_cn: domain.com    # Common/Domain name
crt_o: My Company Name  # Org Name
crt_c: CA    # Country
crt_out: /tmp/ssl.crt  # Output file for generated certificate
key_out: /tmp/ssl.key  # Output file for generated key
key_user: root
key_group: root
key_mode: 0600

file_override: False   # Force overwrite if cert/key already exists. True or False
```
Dependencies
------------

No other role dependencies

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: ssl_crt_gen, crt_out: /etc/pki/certs/out.crt, key_out: /etc/pki/certs/ssl.key, crt_days_valid: 3650 }

License
-------

BSD

Author Information
------------------

