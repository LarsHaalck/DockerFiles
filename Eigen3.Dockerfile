FROM alpine:3.8

ENV EIGEN_VERSION=3.2

RUN apk add --update --no-cache \
    unzip \
    wget && \
    mkdir /opt && cd /opt && \
    wget https://github.com/eigenteam/eigen-git-mirror/archive/branches/${EIGEN_VERSION}.zip && \
    unzip ${EIGEN_VERSION}.zip && \
    mkdir -p /usr/local/include/eigen3 && \
    cp -R eigen-git-mirror-branches-${EIGEN_VERSION}/Eigen /usr/local/include/eigen3/ && \
    cp -R eigen-git-mirror-branches-${EIGEN_VERSION}/unsupported /usr/local/include/eigen3/ && \
    cd / && \
    rm -rf /opt && \
    apk del unzip \
    wget

