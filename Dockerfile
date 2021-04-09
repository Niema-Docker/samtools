# Minimal Docker image for samtools v1.12 using Alpine base
FROM alpine:latest
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install samtools
RUN apk update && \
    apk add bzip2-dev g++ make xz-dev zlib-dev && \
    wget -qO- "https://github.com/samtools/samtools/releases/download/1.12/samtools-1.12.tar.bz2" | tar -xj && \
    cd samtools-1.12 && \
    ./configure --without-curses && \
    make && \
    make install && \
    cd .. && \
    rm -rf samtools-1.12