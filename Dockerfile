FROM golang:bullseye AS xray-build

WORKDIR /xray-plugin

RUN apt update && apt -y upgrade \
    && apt -y install git \
    && git clone --branch v1.5.3 https://github.com/teddysun/xray-plugin.git . \
    && go build

FROM debian:bullseye-slim

EXPOSE 8888/tcp
EXPOSE 8888/udp

RUN apt -y update && apt -y upgrade \
    && apt -y install shadowsocks-libev

COPY --from=xray-build ./xray-plugin /usr/local/bin

RUN chmod +x /usr/local/bin/xray-plugin