# syntax=docker/dockerfile:1.3-labs
FROM python:3.9-alpine

RUN <<EOF
    set -x 
    echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
    echo "@community http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
    apk add --no-cache kubectl@testing jq build-base gcc
    pip3 install httpie
EOF

COPY ./*.sh /test/e2e/

WORKDIR /test/e2e

