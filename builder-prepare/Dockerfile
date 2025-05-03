FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
ENV LD_LIBRARY_PATH=/open5gs/install/lib/x86_64-linux-gnu

ENV http_proxy="http://192.168.12.1:58591"
ENV https_proxy="http://192.168.12.1:58591"
ENV no_proxy="10.*,127.*,172.*,192.*,localhost,0.0.0.0"
ENV HTTP_PROXY="http://192.168.12.1:58591"
ENV HTTPS_PROXY="http://192.168.12.1:58591"
ENV NO_PROXY="10.*,127.*,172.*,192.*,localhost,0.0.0.0"

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bk
COPY sources.list /etc/apt/

# Install updates and dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        ninja-build \
        build-essential \
        flex \
        bison \
        git \
        libsctp-dev \
        libgnutls28-dev \
        libgcrypt-dev \
        libssl-dev \
        libidn11-dev \
        libmongoc-dev \
        libbson-dev \
        libyaml-dev \
        meson \
        mongodb \
        curl \
        gnupg \
        ca-certificates \
        libmicrohttpd-dev \
        libcurl4-gnutls-dev \
        libnghttp2-dev \
        libtins-dev \
        libidn11-dev \
        libtalloc-dev

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs

