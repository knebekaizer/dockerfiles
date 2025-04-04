# docker build -t dev11 -f ./dev11.Dockerfile --build-arg HOME="$HOME" --build-arg USER_ID=$(id -u) --build-arg USER_NAME="$(id -un)" .
# docker run --rm -it -u $(id -u):$(id -g) -v"$HOME":"$HOME" -w"$PWD" dev11 bash
# docker run --rm -v"$HOME":"$HOME" -w"$PWD" dev11 g++ -c -fdump-tree-original-raw nvidia-set2.cpp
#
# # Reuse container:
# docker container create --privileged --hostname dev11 --interactive --tty --name dev11 --volume $HOME:$HOME --network host dev11
# docker container start dev11
# docker exec -w"$PWD" dev11 g++ -c -fdump-tree-original-raw nvidia-set2.cpp

FROM gcc:11-bullseye as builder

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
	apt-get install -y --no-install-recommends build-essential \
	cmake git ca-certificates less ssh-client

ARG   USER_ID
ARG   USER_NAME
ARG   HOME
RUN   useradd -l -d "$HOME" -g staff -M -N -u $USER_ID "$USER_NAME"
USER  $USER_ID

ENV   SHELL /bin/bash
