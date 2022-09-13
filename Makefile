DOCKER_BUILDER=container-builder
DOCKER_REGISTRY?=localhost:5000

.PHONY: all init-builder
all: linuxwolf/busybox linuxwolf/caddy linuxwolf/traefik

init-builder:
	./.builder/init-builder

.cache/docker:
	mkdir -p .cache/docker

# busybox -- base
linuxwolf/busybox:	IMAGE_TAG = 1.34.1.20220912203138

# caddy -- webserver base
linuxwolf/caddy: IMAGE_TAG = 2.5.2.20220912203138
linuxwolf/caddy: linuxwolf/busybox

# traefik -- load-balancer base
linuxwolf/traefik: IMAGE_TAG = 2.8.1.20220912203138
linuxwolf/traefik: linuxwolf/busybox

linuxwolf/%: BASENAME=$(shell basename $@)
linuxwolf/%: .cache/docker init-builder %/Dockerfile
	docker buildx build --builder $(DOCKER_BUILDER) \
		--cache-from type=local,src=.cache/docker \
		--cache-to type=local,dest=.cache/docker,mode=max \
		--output type=image,push=true \
		--platform linux/amd64,linux/arm64 \
		--tag $(DOCKER_REGISTRY)/$@:$(IMAGE_TAG) \
		--build-arg DOCKER_REGISTRY=$(DOCKER_REGISTRY) \
		-f $(BASENAME)/Dockerfile \
		$(BASENAME)
