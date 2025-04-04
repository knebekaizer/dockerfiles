# docker build -t devel -f ./devel.Dockerfile --build-arg HOME="$HOME" --build-arg USER_ID=$(id -u) --build-arg USER_NAME="$(id -un)" .
# docker run --rm -it -v"$HOME":"$HOME" -w"$PWD" devel bash
# docker run --rm -v"$HOME":"$HOME" -w"$PWD" devel g++ -c -fdump-tree-original-raw nvidia-set2.cpp
#
# # Reuse container:
# docker container create --privileged --hostname devel --interactive --tty --name devel --volume $HOME:$HOME --network host devel
# docker container start devel
# docker exec -w"$PWD" devel g++ -c -fdump-tree-original-raw nvidia-set2.cpp

FROM centos:7

RUN yum -y update && \
	yum -y install cmake git ca-certificates less ssh-client

# ARG   USER_ID
# ARG   USER_NAME
# ARG   HOME
# RUN   useradd -l -d "$HOME" -g staff -M -N -u $USER_ID "$USER_NAME"
# USER  $USER_ID

ENV   SHELL /bin/bash
