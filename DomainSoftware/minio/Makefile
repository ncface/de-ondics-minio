#
# ScaleIT-Helferlein
#
# (C) 2019, Ondics GmbH
#

# help-systematik
.PHONY: help

help:
	@echo "# ScaleIT-Helferlein"
	@echo "# (C) 2019, Ondics GmbH"
	@echo Befehle: make ...
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

up:	## alle Container starten
	docker-compose up -d

up-foreground:	## alle Container starten im Foreground für Logfile-Vieweing
	docker-compose up 
	

down: ## alle Container stoppen
	docker-compose down --remove-orphans
	
build: ## alle Container bauen
	#./docker-make.sh
	docker-compose build
	

ps: ## was läuft?
	docker-compose ps
	
bash: ## Die bash im php Container starten
	docker-compose exec de-ondics-minio bash
	
logs: ## Alle stdout's aller Container zeigen
	docker-compose logs -f -t
    
