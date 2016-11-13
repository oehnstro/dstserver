#!/bin/bash

echo "Installing dependencies"

sudo dpkg --add-architecture i386

sudo apt-get update

sudo apt-get install -y libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 wget

echo "Installing steamcmd"

mkdir ~/steamcmd

cd ~/steamcmd

wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz

tar -xvzf steamcmd_linux.tar.gz

echo "Creating server folders"

mkdir -p ~/.klei/DoNotStarveTogether/MyDediServer/Master
mkdir -p ~/.klei/DoNotStarveTogether/MyDediServer/Caves

touch ~/.klei/DoNotStarveTogether/MyDediServer/cluster_token.txt

echo "Copying files"

cp cluster.ini ~/.klei/DoNotStarveTogether/MyDediServer/cluster.ini

cp master_server.ini ~/.klei/DoNotStarveTogether/MyDediServer/Master/server.ini

cp caves_server.ini ~/.klei/DoNotStarveTogether/MyDediServer/Caves/server.ini

cp worldgenoverride.lua ~/.klei/DoNotStarveTogether/MyDediServer/Caves/worldgenoverride.lua

cp modoverrides.lua ~/.klei/DoNotStarveTogether/MyDediServer/Master/modoverrides.lua

echo "Finished"

echo "Paste server token into: ~/.klei/DoNotStarveTogether/MyDediServer/cluster_token.txt"

