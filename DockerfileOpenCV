FROM alpine:3.8

ENV OPENCV_VERSION=3.2.0

RUN apk add --update --no-cache \
    build-base \
    linux-headers \
    cmake \
    wget \
    libgomp \
    openblas-dev \
    libjpeg \
    libjpeg-turbo-dev \
    libpng-dev \
    jasper-dev \
    libpng-dev && \
    mkdir /opt && cd /opt && \
    wget https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip && \
    unzip ${OPENCV_VERSION}.zip && \
    rm -rf ${OPENCV_VERSION}.zip && \
    mkdir -p /opt/opencv-${OPENCV_VERSION}/build && \
    cd /opt/opencv-${OPENCV_VERSION}/build && \
    cmake \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D WITH_FFMPEG=NO \
    -D WITH_IPP=NO \
    -D WITH_OPENEXR=NO \
    -D WITH_TBB=NO \
    -D WITH_OPENMP=ON \
    -D WITH_LAPACK=ON \
    -D BUILD_EXAMPLES=NO \
    -D BUILD_ANDROID_EXAMPLES=NO \
    -D INSTALL_PYTHON_EXAMPLES=NO \
    -D BUILD_DOCS=NO \
    -D BUILD_opencv_python2=NO \
    -D BUILD_opencv_python3=NO \
    .. && \
    make VERBOSE=1 && \
    make && \
    make install && \
    cd / && \
    rm -rf /opt/opencv-${OPENCV_VERSION} && \
    apk del \
    build-base \
    linux-headers \
    cmake \
    wget \
    openblas-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    jasper-dev \
    libpng-dev && \
    apk add --no-cache \
    openblas \
    libjpeg-turbo \
    libpng \
    jasper \
    libpng \
