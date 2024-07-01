#!/bin/bash

test -z $1 && TAG="latest" || TAG="$1"

docker run \
--privileged \
-e "DISPLAY=unix$DISPLAY" \
--log-driver json-file \
--log-opt max-size=10m \
-v /dev/log:/dev/log \
-v /etc/localtime:/etc/localtime \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-v $HOME/.zsh_history:/home/user/.zsh_history \
-v $HOME:/mnt/ \
-v $HOME/.ssh:/home/user/.ssh/ \
--tmpfs=/run --tmpfs=/tmp \
-v /sys/fs/cgroup:/sys/fs/cgroup \
-h docker-rocky9 \
--net host \
--name rocky9-vrdel \
--rm -ti \
ipanema:5000/rocky9-vrdel:$TAG

