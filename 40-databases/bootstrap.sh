#!/bin/bash

dnf install ansible -y

component = $1

cd /home/ec2-user

git clone https://github.com/Saiprasad-T/roboshop-ansible-roles-tf.git

cd roboshop-ansible-roles-tf

git pull

ansible -playbook -e component=$component roboshop.yaml