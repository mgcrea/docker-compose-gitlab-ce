DOCKER_IMAGE := gitlab/gitlab-ce

all: build

bash:
	@source .env
	@docker run --rm --net=host -it gitlab/gitlab-ce:${GITLAB_CE_VERSION} /bin/sh

version:
	@docker run --rm --net=host -it gitlab/gitlab-ce:${GITLAB_CE_VERSION} /opt/gitlab/embedded/bin/psql --version

reconfigure:
	@docker-compose exec gitlab gitlab-ctl reconfigure

backup:
	@docker-compose exec gitlab gitlab-rake gitlab:backup:create

build:
	@bash scripts/buildEnv.sh
