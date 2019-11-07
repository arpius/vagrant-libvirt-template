#!/usr/bin/env bash

 sudo sed -i -e "\\#PasswordAuthentication yes# s#PasswordAuthentication yes#PasswordAuthentication no#g" /etc/ssh/sshd_config
 
 sudo systemctl restart sshd.service
 
 echo "finished"
