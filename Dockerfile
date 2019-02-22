FROM lambdabeta/5b1t-build:latest

LABEL maintainer="lburke@labprogramming.net"

# Clone and build
RUN git clone https://gitlab.com/LabdaABeta/5b1t.git; \
    cd 5b1t; \
    make nodoc && make install; \
    cd ..; \
    rm -rf 5b1t
