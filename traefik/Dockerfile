ARG DOCKER_REGISTRY=localhost:5000
FROM ${DOCKER_REGISTRY}/linuxwolf/busybox:1.34.1.20220912203138

ARG TARGETARCH
ARG TARGETOS
ARG TARGETVARIANT

# traefik @ v2.8.1
COPY --from=traefik@sha256:4e52a5e2495484f5e19a49edfd2f652b0bce7b3603fa0df545ed90168ffae1c3 /usr/local/bin/traefik /bin/traefik
COPY --from=traefik@sha256:4e52a5e2495484f5e19a49edfd2f652b0bce7b3603fa0df545ed90168ffae1c3 /etc/ca-certificates.conf /etc/ca-certificates.conf
COPY --from=traefik@sha256:4e52a5e2495484f5e19a49edfd2f652b0bce7b3603fa0df545ed90168ffae1c3 /etc/ca-certificates /etc/ca-certificates
COPY --from=traefik@sha256:4e52a5e2495484f5e19a49edfd2f652b0bce7b3603fa0df545ed90168ffae1c3 /etc/ssl /etc/ssl

COPY traefik.yaml /app/traefik.yaml

WORKDIR /app

EXPOSE 80/tcp
EXPOSE 80/udp
EXPOSE 443/udp

CMD [ "/bin/traefik" ]