apt-get install software-properties-common
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable edge test"
apt-get update
apt-cache policy docker-ce
apt-get install -y docker-ce

curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/
chmod +x /usr/local/bin/docker-compose
