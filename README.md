# How to run Firefox 56 on Docker

Firefox 56 is the last Firefox to support old-type extensions. 

In particular, it is the last Firefox to support the Scrapbook extension.

You can run Firefox 56 alongside your usual Firefox building a Docker image and launching a Docker container with that image. 

The code in the Dockerfile shares the same X11 socket of the host machine, and from what I read this is not so secure.

This code is mainly taken from http://fabiorehm.com/blog/2014/09/11/running-gui-apps-with-docker/, but downloads Firefox 56 from the Mozilla repository after installing gtk3 over Ubuntu, needed by Firefox

## Install Docker

See, for Ubuntu: https://askubuntu.com/questions/938700/how-do-i-install-docker-on-ubuntu-16-04-lts

## Build a Docker image containing Firefox 56

Run sudo build.sh

## Launch Firefox

sudo docker run -ti --rm \\
       -e DISPLAY=$DISPLAY \\
       -v /tmp/.X11-unix:/tmp/.X11-unix \\
       -v /userDir:/home/developer \\
       firefox

You must replace userDir with an empty dir, where Docker will **write** as it was the user home dir. 

