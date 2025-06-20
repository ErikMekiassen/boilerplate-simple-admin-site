.PHONY: help run stop clean status logs shell

help:		## Viser denne hjelpeteksten
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
build: ## bygger target/ mappen på nytt
	@mvn clean install -DskipTests
run:		## Bygger og kjører containeren
	@mvn jib:dockerBuild -Dimage=admin-web -Dgit.commit.id=local -Dgit.branch=main -Dgit.commit.message.full="Local build" && docker run -it -d -p8080:8080 --name admin-web admin-web:latest || true

clean-build-run: ## bygger og kjører på nytt
	@make clean && make build && make run
test: ## bygger og kjører tester med maven clean install
	@mvn clean install

stop:		## Stopper og fjerner containeren hvis den kjører
	@docker stop admin-web || true
	@docker rm admin-web || true

clean:		## Stopper og sletter containeren og sletter docker-image
	@docker stop admin-web || true
	@docker rm admin-web || true
	@docker rmi admin-web:latest || true

status:		## Viser containerstatus
	@docker ps -a

logs:		## Viser loggene til admin-web
	@docker logs admin-web

shell:		## Koble til containerens shell
	@docker exec -it admin-web /bin/bash
