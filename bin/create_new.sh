#!/bin/sh
NAME=${1}
if [ "${NAME}" = "" ]; then
  echo "Please set Application name"
  exit 1
fi

# create key pair
echo "*** create key pair - ${NAME}.pem"
aws ec2 create-key-pair --key-name ${NAME} | jq -r ".KeyMaterial" > ${NAME}.pem
chmod 0600 ${NAME}.pem
echo "KEY PAIR: ${NAME}.pem"
if [ ! -e ~/.ssh ]; then
  mkdir ~/.ssh
fi
cp ${NAME}.pem ~/.ssh/
chmod 0600 ~/.ssh/${NAME}.pem
~/bin/terraform apply -var 'key_name='${NAME}
