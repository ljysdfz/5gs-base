FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

#RUN mv /etc/apt/sources.list /etc/apt/sources.list.bk
#COPY sources.list /etc/apt/

# Install updates and dependencies
RUN apt-get update && \
    apt-get -y install \
        make \
        g++ \
        libsctp-dev \
        lksctp-tools \
        git \
        vim \
        iproute2 \
        iptables \
        net-tools \
        ifupdown \
        iputils-ping \
        wget \
        libssl-dev

RUN version=3.20 && \
    build=0 && \
    mkdir ~/temp && \
    cd ~/temp && \
    wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz && \
    tar -xzvf cmake-$version.$build.tar.gz && \
    cd cmake-$version.$build/ && \
    ./bootstrap && \
    make -j`nproc` && \
    make install && ldconfig && \
    cmake --version

# Clone and build UERANSIM
RUN git clone https://github.com/aligungr/UERANSIM && \
    cd UERANSIM && git checkout tags/v3.2.6 && \
    make -j`nproc`

