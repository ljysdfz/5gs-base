FROM ctri-ran:builder AS builder
FROM ctri-ran:provenance

COPY --from=builder /UERANSIM/build/nr-gnb /ueransim/gnb
WORKDIR /ueransim
CMD ["bash"]
