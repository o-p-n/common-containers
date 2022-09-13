DOCKER_REGISTRY?=localhost:5000
STAMP?=$(shell git rev-parse --verify HEAD)

DOCKER_BUILDER=container-builder

.PHONY: help all init-builder
help:
	@echo "* all .............................. build all images"
	@echo "* linuxwolf/busybox ................ build BusyBox base image"
	@echo "* linuxwolf/caddy .................. build Caddy webserver image"
	@echo "* linuxwolf/traefik ................ build Traefik load-balancer/ingress image"
	@echo  ""
	@echo "configurable properties:"
	@echo "  - DOCKER_REGISTRY ................ Container registry to push/pull (default: 'localhost:5000')"
	@echo "  - STAMP  ......................... Stamp for image tags (default: current commit hash)"

all: linuxwolf/busybox linuxwolf/caddy linuxwolf/traefik

init-builder:
	./.builder/init-builder

.cache/docker:
	mkdir -p .cache/docker

# busybox -- base
linuxwolf/busybox:	IMAGE_TAG = 1.34.1.$(STAMP)

# caddy -- webserver base
linuxwolf/caddy: IMAGE_TAG = 2.5.2.$(STAMP)
linuxwolf/caddy: linuxwolf/busybox

# traefik -- load-balancer base
linuxwolf/traefik: IMAGE_TAG = 2.8.1.$(STAMP)
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
		--build-arg STAMP=$(STAMP) \
		-f $(BASENAME)/Dockerfile \
		$(BASENAME)
