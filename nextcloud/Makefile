.PHONY: all pull build push

VERSION ?= stable

all: pull build push

pull:
	docker pull arm64v8/nextcloud:$(VERSION)-apache

build:
	docker build . -t munsen/nextcloud:$(VERSION)

push:
	docker push munsen/nextcloud:$(VERSION)
