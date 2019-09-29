# Dockerizing the development version of joplin-web

## Installation

Download content of this repository to your /path/of/choice.

* Edit `mk_prepare.sh` and/or `docker-compose.yml` as you wish - pay
attention to `_USER`, `JW_HTTP_PORT`, `JV_HTTP_PORT`, `JV_DISABLEHOSTCHECK`.

* Start joplin with Web Clipper server (as $_USER, not root).

  * If you work on a desktop, simply run `joplin`.
  * If you are setting things up on a head-less server, copy `.config/joplin-desktop` folder from your desktop to your server and run joplin in terminal mode on the server:
```
$ joplin --profile /home/$_USER/.config/joplin-desktop server start
2019-09-29 15:24:12: "Starting Clipper server on port 41184"
```

* Run the script `mk_prepare.sh` to get docker containers up and running.


If all went well, point your web browser to `http://localhost:$JV_HTTP_PORT/` and
you should see your Joplin notes.

Note: while Joplin (desktop) app automatically syncs the data with your cloud, the terminal version does not - to actually sync any changes, run regularly:

```
$ joplin --profile /home/$_USER/.config/joplin-desktop sync
```
