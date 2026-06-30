#!/usr/bin/make -f

.PHONY: docker
docker: ## Build Jenkins docker image
	docker build -t jenkins-server:2.555.3-lts-jdk21 .

.PHONY: help
help: ## --> It's me here..... "THE HELP" <--
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

backup-server-data:
	docker run --rm \
		-v jenkins-docker-server_data:/data \
		-v $(CURDIR):/backup \
		alpine \
		tar czf /backup/jenkins-home-backup-$(date +%Y%m%d).tar.gz -C /data .

.DEFAULT_GOAL := help
