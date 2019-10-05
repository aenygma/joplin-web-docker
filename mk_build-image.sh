#!/bin/sh

echo "About to:"
echo " 1) download joplin-web.git"
echo " 2) build docker images"
echo ""
echo "Press CTRL+C to abort, otherwise continueing in 5 seconds."
sleep 5

[[ -f master.zip        ]] && rm     master.zip
[[ -d joplin-web-master ]] && rm -rf joplin-web-master

wget https://github.com/foxmask/joplin-web/archive/master.zip \
  || { echo "Trouble."; exit 1; }
unzip -d . master.zip \
  || { echo "Double trouble."; exit 1; }
rm master.zip 2>/dev/null

docker-compose build --no-cache --pull --force-rm

echo "Edit variables in docker-compose.yml as needed."
echo "Run: \`docker-compose up -d\` to start the container."
