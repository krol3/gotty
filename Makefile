REPOSITORY=krol
PROJECT=gotty
PORT=8080
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)

build:
	docker build -t ${REPOSITORY}/${PROJECT}:$(BRANCH) .

run:
	docker run -it -p ${PORT}:${PORT} ${REPOSITORY}/${PROJECT}:$(BRANCH)

push:
	docker push ${REPOSITORY}/${PROJECT}:${BRANCH}

run-privilege:
	docker run -i --rm --pid=host --user nobody -p ${PORT}:${PORT} ${REPOSITORY}/${PROJECT}:$(BRANCH) top