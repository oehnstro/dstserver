#!/bin/bash

source variables

echo "STEAMCMD_DIR: $STEAMCMD_DIR"
echo "INSTALL_DIR: $INSTALL_DIR"
echo "CLUSTER_NAME: $CLUSTER_NAME"
echo "DONTSTARVE_DIR: $DONTSTARVE_DIR"

echo "Installing dependencies"

sudo dpkg --add-architecture i386

sudo apt-get update

sudo apt-get install -y libstdc++6:i386 libgcc1:i386 libcurl4-gnutls-dev:i386 wget

echo "Creating server folders"

mkdir -p "$DONTSTARVE_DIR/$CLUSTER_NAME/Master"
mkdir -p "$DONTSTARVE_DIR/$CLUSTER_NAME/Caves"

touch "$DONTSTARVE_DIR/$CLUSTER_NAME/cluster_token.txt"

echo "Copying files"

cp cluster.ini "$DONTSTARVE_DIR/$CLUSTER_NAME/cluster.ini"

cp master_server.ini "$DONTSTARVE_DIR/$CLUSTER_NAME/Master/server.ini"

cp caves_server.ini "$DONTSTARVE_DIR/$CLUSTER_NAME/Caves/server.ini"

cp worldgenoverride.lua "$DONTSTARVE_DIR/$CLUSTER_NAME/Caves/worldgenoverride.lua"

cp modoverrides.lua "$DONTSTARVE_DIR/$CLUSTER_NAME/Master/modoverrides.lua"

echo "Installing steamcmd"

mkdir $STEAMCMD_DIR

cd $STEAMCMD_DIR

wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz

tar -xvzf steamcmd_linux.tar.gz

echo "Finished"

echo "Paste server token into: $DONTSTARVE_DIR/$CLUSTER_NAME/cluster_token.txt"

