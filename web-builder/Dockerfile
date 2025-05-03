
FROM docker_open5gs:builder

ENV DEBIAN_FRONTEND=noninteractive
ENV LD_LIBRARY_PATH=/open5gs/install/lib/x86_64-linux-gnu

COPY webui/ /open5gs/webui

# Building WebUI of open5gs
RUN cd open5gs/webui && npm ci --no-optional

