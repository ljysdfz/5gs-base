FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
ENV LD_LIBRARY_PATH=/open5gs/install/lib/x86_64-linux-gnu

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        libssl-dev \
        libyaml-dev \
        libmicrohttpd-dev \
        libmongoc-dev \
        libsctp-dev \
        libcurl4-gnutls-dev \
        libtins-dev \
        libidn11-dev \
        libtalloc-dev \
        python3-setuptools \
        python3-wheel \
        python3-pip \
        nano \
        vim \
        curl \
        zip \
        netbase \
        ifupdown \
        net-tools \
        iputils-ping \
        iproute2 \
        iptables \
        tcpdump \
        procps \
        dnsutils \
        traceroute \
        iperf \
        iperf3 \
        wondershaper \
        gnupg \
        nmap && \
    apt-get autoremove -y && apt-get autoclean

RUN pip3 install click

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && apt-get install -y nodejs && \
    apt-get remove -y curl && apt-get autoremove -y && apt-get autoclean

RUN update-ca-certificates

