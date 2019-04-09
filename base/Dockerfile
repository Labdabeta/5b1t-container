FROM alpine:edge

LABEL maintainer="lburke@labprogramming.net"

# Add extra repositories
RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories; \
    echo 'http://dl-cdn.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories; \
    echo 'http://dl-cdn.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories;

# System setup
RUN apk add --no-cache \
    build-base \
    coreutils \
    curl-dev \
    gcc-gnat \
    git \
    gmp-dev \
    gnu-libiconv-dev \
    openssl \
    python \
    readline-dev \
    sqlite-dev \
    sqlite-libs

ENV GPR_PROJECT_PATH /usr/local/share/gpr

# Bootstrap GPRBuild
RUN git clone https://github.com/AdaCore/xmlada.git; \
    git clone https://github.com/AdaCore/gprbuild.git; \
    cd gprbuild; ./bootstrap.sh --with-xmlada=../xmlada; \
    cd ../xmlada; ./configure && make && make install; \
    cd ../gprbuild; \
    make setup && make all && make install; \
    make libgpr.build && make libgpr.install; \
    cd ..; rm -rf xmlada gprbuild


# Install gnatcoll-core
RUN git clone https://github.com/AdaCore/gnatcoll-core.git; \
    cd gnatcoll-core; make prefix=/usr/local setup && make && make install; \
    cd ..; rm -rf gnatcoll-core

# Install gnatcoll-db and gnatcoll-bindings
RUN git clone https://github.com/AdaCore/gnatcoll-db.git; \
    git clone https://github.com/AdaCore/gnatcoll-bindings.git; \
    cd gnatcoll-bindings/readline; ./setup.py build --accept-gpl && ./setup.py install; \
    cd ../gmp; ./setup.py build && ./setup.py install; \
    cd ../iconv; ./setup.py build && ./setup.py install; \
    cd ../lzma; ./setup.py build && ./setup.py install; \
    cd ../python; ./setup.py build && ./setup.py install; \
    cd ../zlib; ./setup.py build && ./setup.py install; \
    cd ../../gnatcoll-db/gnatcoll_db2ada; make && make install; \
    cd ../sql; make && make install; \
    cd ../sqlite; make GNOTCOLL_SQLITE=external setup && make && make install; \
    cd ../xref; make && make install; \
    cd ../gnatinspect; make && make install; \
    cd ../..; rm -rf gnatcoll-db gnatcoll-bindings

RUN adduser -D mola
