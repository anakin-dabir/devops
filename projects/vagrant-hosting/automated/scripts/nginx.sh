#!/bin/bash

# updating packages and installing new ones
apt update -y
apt install nginx -y

# configuring nginx
cat <<EOF > /etc/nginx/sites-available/devops-project
upstream frontend {
	server client;
}

upstream backend {
	server server;
}

server {
	listen 80;
	location / {
		proxy_pass http://frontend;
	}

	location /api/ {
		proxy_pass http://backend;
	}

}
EOF

rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/devops-project /etc/nginx/sites-enabled/devops-project

# starting nginx server
systemctl start nginx
systemctl enable nginx
systemctl status nginx
