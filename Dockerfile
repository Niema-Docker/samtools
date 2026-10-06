# Minimal Docker image for samtools using Alpine base
FROM alpine:latest

# install samtools
RUN apk update && \
    apk add --no-cache bash bzip2-dev g++ make xz-dev zlib-dev && \
    wget -qO- "https://github.com/samtools/samtools/releases/download/1.24/samtools-1.24.tar.bz2" | tar -xj && \
    cd samtools-* && \
    ./configure --without-curses && \
    make && \
    make install && \
    cd .. && \
    rm -rf samtools-*
