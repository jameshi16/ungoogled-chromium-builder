#!/bin/bash
# Prepares the directory for docker builds, and extract files after they're done building
# Might want to run this in screen

set -e

IMAGE_DISTRO="debian"
IMAGE_VERSION="buster"
GIT_TAG="unportable"

clean() {
	rm -rf ./output
}

build() {
	docker build . -t "ungoogled-chromium:latest" --build-arg=IMAGE_DISTRO=$IMAGE_DISTRO --build-arg=IMAGE_VERSION=$IMAGE_VERSION --build-arg=GIT_TAG=$GIT_TAG
}

extract() {
	docker run --name ungoogled --detach ungoogled-chromium:latest
	docker cp ungoogled:/tmp/ungoogled-chromium-builder/output output
}

prune() { # ignore errors
	set +e
	docker container kill ungoogled 2>/dev/null 1>/dev/null
	docker container rm ungoogled
	set -e
}

# process
clean
prune
build
extract
prune
