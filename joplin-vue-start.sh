#!/bin/sh

cd /app/joplin-vue
echo "JW_HTTP_PORT: $JW_HTTP_PORT"
echo "JV_HTTP_PORT: $JV_HTTP_PORT"
echo "Be patient, setting web app up takes time..."

[[ ! -z $JW_HTTP_PORT ]] && \
  sed -i "s@1\\:8001@1\\:$JW_HTTP_PORT@"                     vue.config.js

[[ ! -z $JV_HTTP_PORT ]] && \
  sed -i "s@--port 8080@--port $JV_HTTP_PORT@"               package.json

[[ $JV_DISABLEHOSTCHECK == "true" ]] && \
  sed -i '/devServer: {$/ a \ \ \ \ disableHostCheck: true,' vue.config.js

npm install
npm run serve
#npm run build # and setup nginx to serve the dist directory
