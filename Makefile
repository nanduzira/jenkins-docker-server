#!/usr/bin/make -f

.PHONY: docker
docker: ## Build Jenkins docker image
	docker build -t jenkins-server:2.401.1-lts-jdk11 .

.PHONY: help
help: ## --> It's me here..... "THE HELP" <--
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
