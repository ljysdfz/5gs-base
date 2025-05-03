FROM ctri-5gc:web-builder AS builder
FROM ctri-5gc:provenance

COPY --from=builder /open5gs/install/bin /open5gs/install/bin
COPY --from=builder /open5gs/install/etc /open5gs/install/etc
COPY --from=builder /open5gs/install/include /open5gs/install/include
COPY --from=builder /open5gs/install/lib /open5gs/install/lib
COPY --from=builder /open5gs/webui /open5gs/webui

# Set the working directory to /open5gs
WORKDIR /open5gs

COPY open5gs_init.sh /
CMD ["/open5gs_init.sh"]
