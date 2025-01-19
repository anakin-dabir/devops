#!/bin/bash

PROJECT_DIR="/opt/devops-project"

# updating and installing packages (ubuntu)
apt update -y
apt install curl git -y

# installing nodejs with nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh && \
	nvm install 21 && \
	nvm use 21

# cloning repository and running server
git clone https://github.com/anakin-dabir/devops-web-project.git $PROJECT_DIR
cd $PROJECT_DIR/server-vm && \
	npm install && \
	npm install -g pm2

# adding .venv
wget -P $PROJECT_DIR/server-vm/ http://172.16.0.2/.env

# running the project
pm2 start index.js -n express-server
pm2 start ./redis/workers/index.js -n reddis-server

rm -rf $PROJECT_DIR/client-vm



