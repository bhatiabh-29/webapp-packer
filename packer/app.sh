#!/bin/bash

sleep 30
sudo apt-get update -y


# for unzipping the code folder uploaded in the virtual machine
sudo apt-get install zip unzip
sudo apt update && sudo apt install --assume-yes curl
curl --silent --location https://deb.nodesource.com/setup_16.x  | sudo bash -

#installing the database 
sudo apt-get install mysql-server -y
sudo mysql <<EOF

CREATE DATABASE cloud;

CREATE USER 'user'@'localhost' IDENTIFIED BY 'user';

GRANT ALL PRIVILEGES ON cloud.* TO 'user'@'localhost' WITH GRANT OPTION;

FLUSH PRIVILEGES;

EOF

echo "Starting mysql server"

sudo service mysql start



sudo apt-get install -y nodejs
sudo apt-get install -y gcc g++ make
cd ~/ && unzip webapp.zip
cd ~/webapp && npm i



sudo mv /tmp/webapp.service /etc/systemd/system/webapp.service
sudo systemctl enable webapp.service
sudo systemctl start webapp.service
