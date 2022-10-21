FROM node:lts-alpine

# arm64 or amd64
ARG PLATFORM

RUN apk add --no-cache --upgrade bash

ENV BOS_DEFAULT_SAVED_NODE=embassy
RUN npm i -g balanceofsatoshis

WORKDIR /balanceofsatoshis/

ADD credentials.json /credentials.json
ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh
