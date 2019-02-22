FROM alpine:edge

LABEL maintainer="lburke@labprogramming.net"

# Add extra repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories; \
    echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories; \
    echo 'http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories;

# System setup
RUN apk add --no-cache \
    aspell \
    bash \
    bc \
    build-base \
    colordiff \
    curl-dev \
    gawk \
    gcc-gnat \
    git \
    gmp-dev \
    lcov \
    openssl \
    texlive-full \
    unifont \
    valgrind \
    vim \
    wget

# Fix texlive mktexlsr
RUN ln -s /usr/bin/mktexlsr /usr/bin/mktexlsr.pl

# Bootstrap GPRBuild
RUN git clone https://github.com/AdaCore/xmlada.git; \
    git clone https://github.com/AdaCore/gprbuild.git; \
    cd gprbuild; ./bootstrap.sh --with-xmlada=../xmlada; \
    cd ..; \
    rm -rf xmlada gprbuild

RUN adduser -D mola
