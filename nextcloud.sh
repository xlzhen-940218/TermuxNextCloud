#!/bin/bash
cd ~/;
pkg upgrade -y;
pkg install wget unzip openssh php -y;
if [ ! -f ~/latest.zip ]; then
    echo "nextcloud File not found, start download..."
    pkg install wget -y && wget https://download.nextcloud.com/server/releases/latest.zip
else
    echo "nextcloud File exist"
fi
echo "unzip nextcloud..."
unzip ~/latest.zip
echo "create start_server.sh file";
echo "cd ~/nextcloud && php -S 0.0.0.0:8888" > start_server.sh;
echo "set admin privigate permission to start_server.sh";
chmod 777 start_server.sh;
echo "set nextcloud php server init,please access link http://localhost:8888";
echo "sshd \nnohup ~/start_server.sh > /dev/null 2>&1 &" > ~/.bashrc;
echo "start server...";
sshd
nohup ~/start_server.sh > /dev/null 2>&1 &
