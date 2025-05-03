# Build final image
FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

#RUN mv /etc/apt/sources.list /etc/apt/sources.list.bk
#COPY sources.list /etc/apt/

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3-setuptools \
        python3-wheel \
        python3-pip \
        libsctp-dev \
        lksctp-tools \
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

