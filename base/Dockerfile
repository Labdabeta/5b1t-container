FROM alpine:edge

LABEL maintainer="lburke@labprogramming.net"

# Add extra repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories; \
    echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories; \
    echo 'http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories;

# System setup
RUN apk add --no-cache \
    build-base \
    curl-dev \
    gcc-gnat \
    git \
    gmp-dev \
    openssl

# Bootstrap GPRBuild
RUN git clone https://github.com/AdaCore/xmlada.git; \
    git clone https://github.com/AdaCore/gprbuild.git; \
    cd gprbuild; ./bootstrap.sh --with-xmlada=../xmlada; \
    cd ..; \
    rm -rf xmlada gprbuild

RUN adduser -D mola
