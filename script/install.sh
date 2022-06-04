#!/bin/bash

echo "apt install tools"
apt-get update
apt-get install -y wget curl unzip

apt-get autoremove -y
apt-get autoclean -y
rm -rf /var/cache/apt/*


echo "install geth ..."
cd /tmp
wget   $(curl -s https://api.github.com/repos/bnb-chain/bsc/releases/latest |grep browser_ |grep geth_linux |cut -d\" -f4)
chmod +x geth_linux
mv geth_linux /usr/local/bin/geth

# user
useradd -m -u 1000  bscuser
# var

mkdir ${BSC_LOCAL_DIR} -p

cp /tmp/genesis.json ${BSC_LOCAL_DIR}

chown -R bscuser:bscuser ${BSC_LOCAL_DIR}

# 
#  init node named node1
# 可以加一个if