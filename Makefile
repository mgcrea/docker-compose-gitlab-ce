DOCKER_IMAGE := gitlab/gitlab-ce

all: build

bash:
	@source .env
	@docker run --rm --net=host -it ${DOCKER_IMAGE}:${GITLAB_CE_VERSION} /bin/sh

build:
	@bash scripts/buildEnv.sh
