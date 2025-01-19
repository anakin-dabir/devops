#!/bin/bash


# installing and updating packages
apt update -y
apt install redis-server -y

# configuring reddis-server
sed -i -e 's/^bind 127.0.0.1.*/bind 0.0.0.0/' \
       -e 's/^supervised no/supervised systemd/' \
       -e 's/^# requirepass.*/requirepass Proexsus1/' \
       /etc/redis/redis.conf

# enabling service
systemctl start redis.service
systemctl enable redis.service
systemctl status redis

