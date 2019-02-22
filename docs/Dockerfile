FROM lambdabeta/5b1t-test:latest

LABEL maintainer="lburke@labprogramming.net"

# System setup
RUN apk add --no-cache \
    texlive-full \
    unifont

# Fix texlive mktexlsr
RUN ln -s /usr/bin/mktexlsr /usr/bin/mktexlsr.pl
