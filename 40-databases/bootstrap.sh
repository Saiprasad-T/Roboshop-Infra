#!/bin/bash

dnf install ansible -y  #install ansible

component=$1   #mongodb will come in $1
environment=$2

cd /home/ec2-user  #go this path $ do git clone

git clone https://github.com/Saiprasad-T/roboshop-ansible-roles-tf.git

cd roboshop-ansible-roles-tf #move this directory

git pull  #updates if you find any updates

ansible-playbook -e component=$component -e environment=$environment roboshop.yaml #run this play book