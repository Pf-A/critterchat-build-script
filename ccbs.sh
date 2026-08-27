echo "Installing basic stuff (python, etc)"
sudo apt install python3 python3-dev python3-pip pkg-config default-libmysqlclient-dev build-essential ffmpeg 
echo "installing git, just and npm"
echo "this will take longer; i blame npm"
sudo apt install just git npm


git clone https://github.com/DragonMinded/critterchat.git
cd ~/critterchat

just setup
just init 
just manage database create

echo "Creating test user"
echo "login with username test and password test"
just manage user create -u test -p test
echo "creating room with name test room"
just manage room create -n "Test Room" -a on

echo 
echo "starting frontend..."
echo "http://localhost:5678
just run




