#!/bin/bash

set -e

echo "Installing basic stuff (python, etc)"
sudo apt update
sudo apt install -y python3 python3-dev python3-pip pkg-config \
    default-libmysqlclient-dev build-essential ffmpeg

echo "Installing git, just and npm"
echo "This will take longer; I blame npm"
sudo apt install -y just git npm

echo "Cloning CritterChat..."
git clone https://github.com/DragonMinded/critterchat.git ~/critterchat
cd ~/critterchat

just setup
just init
just manage database create

echo "Creating test user"
echo "Login with username test and password test"
just manage user create -u test -p test

echo "Creating room with name test room"
just manage room create -n "Test Room" -a on

echo
echo "Starting frontend..."
echo "http://localhost:5678"

just run
