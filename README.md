# Dockerizing the development version of joplin-web

Features:
* [Joplin Web](https://github.com/foxmask/joplin-web) - development version!
* [Joplin terminal](https://github.com/laurent22/joplin) application:
  * running Web Clipper service (`joplin server start`);
  * syncing notes with cloud once a minute.

## Installation

Download content of this repository to your /path/of/choice and `cd` to it.

* Edit `docker-compose.yml` as you wish - pay
attention to:
  * `volumes`: the first parameter is a path to the existing Joplin Desktop profile. (Copy it from your computer where you use Joplin Desktop App with Web Clipper Option enabled.)
  * `JOPLIN_WEBCLIPPER_TOKEN`: the authorization TOKEN from Joplin Desktop App.
* Run the script `mk_prepare.sh` to get the docker image built.
* Run `docker-compose up -d` to start the container.

If all went well, point your web browser to `http://localhost:8001/` and you should see your Joplin notes.

## To do

* Comment on setting up a web proxy with SSL and authentication to access http://localhost:8001 from remote computers.
