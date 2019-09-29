#!/bin/sh

# Set username of user who runs joplin app with Web Clipper on localhost
export _USER=username

# Set port numbers
export JW_HTTP_PORT=8001 # Where the joplin-web backend listens
export JV_HTTP_PORT=8002 # Where the joplin-vue frontend listens

# Set TOKEN for Web Clipper (see Joplin desktop app - Tools / Web Clipper Options)
export TOKEN=0b1c579cb0bd20d35b3ef799f6065f5706fe9bca060781368a7070c64d55e0dec2ccc4566c36768f7203cd0ed5b39b9f13828f0f2bff1faa327637a4eee75c90



#### Hic Sunt Leones ###########################################################

echo "About to:"
echo " 1) download joplin-web.git"
echo " 2) build docker images"
echo " 3) start docker containers joplin-web & joplin-vue"
echo ""
echo "Edit variables in $0 and docker-compose.yml as needed."
echo "Press CTRL+C to abort, otherwise continueing in 5 seconds."
sleep 5

export _UID=$(id -u $_USER)
export _GID=$(id -g $_USER)

[[ -f master.zip        ]] && rm     master.zip
[[ -d joplin-web-master ]] && rm -rf joplin-web-master

wget https://github.com/foxmask/joplin-web/archive/master.zip \
  || { echo "Trouble."; exit 1; }
unzip -d . master.zip \
  || { echo "Double trouble."; exit 1; }
rm master.zip

docker-compose build --no-cache --pull --force-rm \
  && docker-compose up -d \
  && echo "Point your browser to http://localhost:$JV_HTTP_PORT/" \
  && echo "(May take some time until joplin-vue is up and running...)"
