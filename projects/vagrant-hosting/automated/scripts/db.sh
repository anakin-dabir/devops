#!/bin/bash

# installing and updating packages
apt update -y
apt install gnupg curl -y


# installing mongodb
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

apt update
apt install mongodb-org -y
systemctl daemon-reload
systemctl start mongod

# configuring mondod
mongosh <<EOF
use Hotel
db.myCollection.insertOne({ name: "sample document" })
EOF

wget -P /opt http://172.16.0.2/hotel.tar.gz && \
	tar -xzf /opt/hotel.tar.gz -C /opt && \
	mongorestore --db Hotel /opt/Hotel/Hotel

sed -i -E 's/^(\s*bindIp:).*/\1 0.0.0.0/' /etc/mongod.conf


# enabling service
systemctl restart mongod
systemctl enable mongod
systemctl status mongod
