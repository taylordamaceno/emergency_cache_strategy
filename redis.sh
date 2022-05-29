#!/bin/bash
#install basic packages
sudo apt-get install net-tools -y
sudo apt-get install curl -y
sudo apt-get install telnet -y 
sudo apt-get install bind-utils -y 
sudo apt-get install net-tools -y 
sudo apt get install curl -y 
sudo apt-get install bash-completion
#install golang
sudo apt install golang
# install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
# installl docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.4.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo gpasswd -a $USER  docker
sudo gpasswd -a $USER root
sudo service docker start
sudo usermod -aG docker $USER
newgrp docker
# Subindo redis
docker run -d -p  6379:6379 --restart=always  --name redis_smr --memory="15g"  --cpus="7.0"  -v redis_data:/data  redis:latest
