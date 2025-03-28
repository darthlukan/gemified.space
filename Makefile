REGISTRY := quay.io
IMAGE := darthlukan/agate
TAG := latest
DOMAIN := gemified.space


.PHONY: build
build:
	podman build -f ./Dockerfile -t $(REGISTRY)/$(IMAGE):$(TAG)

.PHONY: push
push:
	podman push $(REGISTRY)/$(IMAGE):$(TAG)

.PHONY: run-dev
run-dev: build
	podman run -it -v ./$(DOMAIN):/$(DOMAIN) -v ./.certificates:/certs -p 1965:1965 $(REGISTRY)/$(IMAGE):$(TAG)

.PHONY: run
run:
	podman run -it -v ./$(DOMAIN):/$(DOMAIN) -v ./.certificates:/certs -p 1965:1965 $(REGISTRY)/$(IMAGE):$(TAG)

.PHONY: clean
clean:
	podman rm $$(podman ps -a | grep 'Exited' | awk '{print $$1}')
	podman rmi $$(podman images | grep '<none>' | awk '{print $$3}')
