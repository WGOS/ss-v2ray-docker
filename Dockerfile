FROM golang:bullseye AS v2ray-build

WORKDIR /v2ray-plugin

RUN apt update && apt -y upgrade \
    && apt -y install git \
    && git clone --branch v1.3.1 https://github.com/shadowsocks/v2ray-plugin.git . \
    && go build

FROM debian:bullseye-slim

EXPOSE 8888

RUN apt -y update && apt -y upgrade \
    && apt -y install shadowsocks-libev

COPY --from=v2ray-build ./v2ray-plugin /usr/local/bin

RUN chmod +x /usr/local/bin/v2ray-plugin