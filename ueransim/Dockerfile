FROM docker_ueransim:builder AS ueransim_builder
FROM docker_ueransim:ueransim_provenance

COPY --from=ueransim_builder /UERANSIM/build /UERANSIM/build
COPY --from=ueransim_builder /UERANSIM/config /UERANSIM/config

# Set the working directory to UERANSIM
WORKDIR UERANSIM/build

COPY ueransim_image_init.sh /
CMD /ueransim_image_init.sh
