#!/bin/bash

# -v "${HOME}":/home/user/ \

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
-h ubuntuc \
--net host \
--name ubuntuc \
--rm -ti \
vrdel-ansible-ubuntuc /bin/zsh
