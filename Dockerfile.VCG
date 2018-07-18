FROM alpine:3.8

RUN apk add --update --no-cache \
    unzip \
    wget && \
    mkdir /opt && cd /opt && \
    wget https://github.com/cnr-isti-vclab/vcglib/archive/v1.0.1.zip && \
    unzip v1.0.1.zip && \
    mkdir -p /usr/local/include && \
    cp -R vcglib-1.0.1/vcg /usr/local/include/vcg && \
    cd / && \
    rm -rf /opt && \
    apk del unzip \
    wget

