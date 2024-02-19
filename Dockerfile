FROM node:lts-alpine

# arm64 or amd64
ARG PLATFORM
ARG ARCH

RUN apk add --no-cache --upgrade bash

ENV BOS_DEFAULT_SAVED_NODE=embassy
RUN npm i -g balanceofsatoshis@17.8.0

WORKDIR /balanceofsatoshis/

ADD credentials.json /credentials.json
ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
ADD check-cmd.sh /usr/local/bin/check-cmd.sh
RUN chmod a+x /usr/local/bin/*.sh
