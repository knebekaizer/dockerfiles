# docker build -t devel -f ./devel.Dockerfile --build-arg HOME="$HOME" --build-arg USER_ID=$(id -u) --build-arg USER_NAME="$(id -un)" .
# docker run --rm -it -v"$HOME":"$HOME" -w"$PWD" devel bash
# docker run --rm -v"$HOME":"$HOME" -w"$PWD" devel g++ -c -fdump-tree-original-raw foo.cpp
#
# # Reuse container:
# docker container create --privileged --hostname devel --interactive --tty --name devel --volume $HOME:$HOME --network host devel
# docker container start devel
# docker exec -w"$PWD" devel g++ -c -fdump-tree-original-raw foo.cpp

FROM debian as builder

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get install -y --no-install-recommends build-essential \
	cmake git ca-certificates less ssh-client \
    gawk bison python3

ARG   USER_ID
ARG   USER_NAME
ARG   HOME
RUN   useradd -l -d "$HOME" -g staff -M -N -u $USER_ID "$USER_NAME"

# comment this out in case of the conflicting id
USER  $USER_ID

ENV   SHELL /bin/bash
