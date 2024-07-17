#!/bin/bash

docker run \
--cap-add=SYS_ADMIN \
--device /dev/snd \
--device /dev/dri \
-e "DISPLAY=unix$DISPLAY" \
--log-driver json-file \
--log-opt max-size=10m \
-v /dev/log:/dev/log \
-v /etc/localtime:/etc/localtime \
-v "${HOME}":/mnt/ \
-v "${HOME}"/.ssh:/home/user/.ssh/ \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-h rocky1 \
--net host \
--name rocky1 \
--rm -ti \
vrdel-ansible-rocky1 /bin/zsh
