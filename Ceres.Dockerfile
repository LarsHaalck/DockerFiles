FROM alpine:edge

# TODO: remove testing repo when glog and gflags are in main
RUN apk add --update --no-cache \
    build-base \
    linux-headers \
    wget \
    eigen-dev \
    cmake \
    glog-dev \
    suitesparse-dev \
    openblas-dev \
    libgomp \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

ENV OPENBLAS_NUM_THREADS 1
ENV VERSION 1.14.0

RUN mkdir /opt && cd /opt && \
    wget http://ceres-solver.org/ceres-solver-${VERSION}.tar.gz && \
    tar -xf ceres-solver-${VERSION}.tar.gz  && \
    rm -f ceres-solver-${VERSION}.tar.gz  && \
    mkdir -p /opt/ceres-solver-${VERSION}/build && \
    cd /opt/ceres-solver-${VERSION}/build && \
    cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D CXSPARSE=OFF \
    -D BUILD_TESTING=OFF \
    -D BUILD_EXAMPLES=OFF \
    .. && \
    make -j12 && \
    make install && \
    rm -rf /opt/ceres-solver-${VERSION}

RUN apk del \
    build-base \
    linux-headers \
    wget \
    eigen-dev \
    cmake \
    glog-dev \
    suitesparse-dev \
    openblas-dev

RUN apk add --no-cache \
    glog \
    suitesparse \
    openblas \
    --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/
