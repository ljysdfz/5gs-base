FROM ctri-ran:builder AS builder
FROM ctri-ran:provenance

COPY --from=builder /UERANSIM/build/nr-ue /ueransim/ue
WORKDIR /ueransim
CMD ["bash"]
