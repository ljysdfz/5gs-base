FROM docker_open5gs:builder_prepare

ENV DEBIAN_FRONTEND=noninteractive
ENV LD_LIBRARY_PATH=/open5gs/install/lib/x86_64-linux-gnu

# Get open5gs code and install
# RUN git clone --recursive https://github.com/open5gs/open5gs &&
COPY open5gs/ /open5gs
RUN cd open5gs && \ 
#    git checkout main && \
    meson build --prefix=`pwd`/install && \
    ninja -C build && cd build && ninja install && \
    mkdir -p /open5gs/install/include

# Building WebUI of open5gs
# RUN cd open5gs/webui && npm ci --no-optional

