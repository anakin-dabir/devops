#!/bin/bash

PROJECT_DIR="/ops/devops-project"

# updating and installing packages (centOS)
yum install git httpd -y

# installing node via nvm
git clone https://github.com/anakin-dabir/devops-web-project.git $PROJECT_DIR
mv $PROJECT_DIR/client-vm/dist/* /var/www/html/

# starting and enabling httpd service
systemctl start httpd
systemctl enable httpd
systemctl status httpd

rm -rf $PROJECT_DIR
