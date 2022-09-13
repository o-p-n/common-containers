ARG DOCKER_REGISTRY=localhost:5000
FROM ${DOCKER_REGISTRY}/linuxwolf/busybox:1.34.1.20220912203138

ARG TARGETARCH
ARG TARGETOS
ARG TARGETVARIANT

# caddy @ v2.5.2
COPY --from=caddy@sha256:c2aa034bd91237e02c80e030f1366fe0e20c88dfc6b9eac5c3cfefdc447b7bc9 /usr/bin/caddy /bin/caddy
COPY Caddyfile /app/Caddyfile

WORKDIR /app

EXPOSE 80/tcp

CMD [ "caddy", "run" ]
