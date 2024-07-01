#!/bin/bash

test -z $1 && TAG="latest" || TAG="$1"

# docker run -d \
docker run \
--cap-add=SYS_ADMIN \
--device /dev/snd \
--device /dev/dri \
-e "DISPLAY=unix$DISPLAY" \
--log-driver json-file \
--log-opt max-size=10m \
-v /dev/log:/dev/log \
-v /etc/localtime:/etc/localtime \
-v $HOME:/mnt/ \
-v $HOME:/home/user/ \
-v $HOME/.ssh:/home/user/.ssh/ \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $HOME/.zsh_history:/home/user/.zsh_history \
-h ubuntu-c \
--net host \
--name ubuntu-c \
--rm -ti \
vrdel-ansible-ubuntu-c:$1 /bin/zsh
