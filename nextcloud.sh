#!/bin/bash
cd ~/
pkg upgrade -y \
pkg install openssh -y \
if [ -e ~/latest.zip ]
then
    unzip ~/latest.zip \
else
    pkg install wget -y && wget https://download.nextcloud.com/server/releases/latest.zip \
    unzip ~/latest.zip \
fi
pkg install php -y \
echo \"cd ~/nextcloud && php -S 0.0.0.0:8888\" > start_server.sh \
chmod 777 start_server.sh \
echo \"sshd \r\n nohup ~/start_server.sh > /dev/null 2>&1 &\" > ~/.bashrc \
exit
