# Minimal Docker image for samtools using Alpine base
FROM alpine:3.13.5

# install samtools
RUN apk update && \
    apk add bash bzip2-dev g++ make xz-dev zlib-dev && \
    wget -qO- "https://github.com/samtools/samtools/releases/download/1.24/samtools-1.24.tar.bz2" | tar -xj && \
    cd samtools-* && \
    ./configure --without-curses && \
    make && \
    make install && \
    cd .. && \
    rm -rf samtools-*
