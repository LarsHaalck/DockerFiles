FROM larshaalck/eigen:3.2

FROM alpine:3.8

RUN mkdir -p /usr/local/include
COPY --from=0 /usr/local/include/eigen3 /usr/local/include/eigen3
RUN apk add --update --no-cache \
    build-base \
    linux-headers \
    cmake \
    wget \
    openblas-dev \
    boost-dev \
    gmp-dev \
    mpfr-dev

RUN mkdir /opt && cd /opt && \
    wget https://github.com/CGAL/cgal/releases/download/releases%2FCGAL-4.11.2/CGAL-4.11.2.zip && \
    unzip CGAL-4.11.2.zip && \
    rm -rf CGAL-4.11.2.zip && \
    mkdir -p /opt/CGAL-4.11.2/build && \
    cd /opt/CGAL-4.11.2/build && \
    cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    .. && \
    make VERBOSE=1 && \
    make && \
    make install && \
    cd / && \
    rm -rf /opt/CGAL-4.11.2

RUN apk del \
    build-base \
    linux-headers \
    cmake \
    wget \
    openblas-dev \
    boost-dev \
    mpfr-dev \
    gmp-dev && \
    apk add --no-cache \
    openblas \
    boost \
    mpfr3 \
    gmp

RUN rm -rf /usr/local/include/eigen3
