CONTAINER_NAME := iridium-acars
GIT_HASH       := $(shell git log --format="%h" -n 1)
TARGET         := Dockerfiles/Dockerfile

build:
	docker build .-t ${DOCKER_USERNAME}/${CONTAINER_NAME}:${GIT_HASH} -f ${TARGET}

push:
	docker push ${DOCKER_USERNAME}/${CONTAINER_NAME}:${GIT_HASH}

