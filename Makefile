#
# Makefile fÃ¼r App
# - Bau der Images
# - Images fÃ¼r verschiedene App-Pools umbenennen
# - Images in App-Pools pushen
# 
# Ondics GmbH, 2019
#


# für debugging einschalten
#SHELL = bash -x

APP_NAME = de-ondics-minio

#ENVIRONMENT=r16-app-pool-nilsclauss
ENVIRONMENT=r16-app-pool-clausnizer-ondics-dev

.PHONY: help

help: ## Diese Hilfe. (C) 2019, Ondics GmbH
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo "Akuell eingestellt:"
	@echo "App-Pool: $(APP_POOL_REGISTRY)"
	@echo "Entwicklungsumgebung: $(ENVIRONMENT)"
	@echo ""

.DEFAULT_GOAL := help


build-domain: ## Alles bauen
	docker-compose build de-ondics-minio

build-sidecar: ## Images erstellen für Sidecar
	docker-compose build de-ondics-minio-registration
	docker-compose build de-ondics-minio-webcontent
	docker-compose build de-ondics-minio-licence

build: build-domain build-sidecar ## Alles bauen, komplett
