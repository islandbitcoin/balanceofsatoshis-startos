ASSETS := $(shell yq e '.assets.[].src' manifest.yaml)
ASSET_PATHS := $(addprefix assets/,$(ASSETS))
VERSION := $(shell yq e ".version" manifest.yaml)
S9PK_PATH=$(shell find . -name balanceofsatoshis.s9pk -print)

# delete the target of a rule if it has changed and its recipe exits with a nonzero exit status
.DELETE_ON_ERROR:

all: verify

verify: balanceofsatoshis.s9pk $(S9PK_PATH)
	embassy-sdk verify s9pk $(S9PK_PATH)

install: all
	embassy-cli package install balanceofsatoshis.s9pk

clean:
	rm -f image.tar
	rm -f balanceofsatoshis.s9pk

balanceofsatoshis.s9pk: credentials.json manifest.yaml assets/compat/* image.tar docs/instructions.md $(ASSET_PATHS)
	embassy-sdk pack

image.tar: Dockerfile docker_entrypoint.sh assets/utils/*
	DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build --tag start9/balanceofsatoshis/main:$(VERSION) --platform=linux/arm64 -o type=docker,dest=image.tar .