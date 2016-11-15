export OS_AUTH_URL=https://keystone-yeg.cloud.cybera.ca:5000/v2.0

echo "Please enter your OpenStack Username: "
read -r OS_USERNAME_INPUT
export OS_USERNAME=$OS_USERNAME_INPUT
export OS_TENANT_NAME=$OS_USERNAME_INPUT
export OS_PROJECT_NAME=$OS_USERNAME_INPUT

echo "Please enter your OpenStack Password: "
read -sr OS_PASSWORD_INPUT
export OS_PASSWORD=$OS_PASSWORD_INPUT

export OS_REGION_NAME="Edmonton"
if [ -z "$OS_REGION_NAME" ]; then unset OS_REGION_NAME; fi

