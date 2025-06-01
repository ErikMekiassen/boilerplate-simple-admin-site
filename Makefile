.PHONY: help run stop clean status logs shell

help:		## Viser denne hjelpeteksten
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

run:		## Bygger og kjører containeren
	@mvn jib:dockerBuild -Dimage=boilerplate-web -Dgit.commit.id=local -Dgit.branch=main -Dgit.commit.message.full="Local build" && docker run -it -d -p8080:8080 --name boilerplate-web boilerplate-web:latest || true

test: ## bygger og kjører tester med maven clean install
	@mvn clean install

stop:		## Stopper og fjerner containeren hvis den kjører
	@docker stop boilerplate-web || true
	@docker rm boilerplate-web || true

clean:		## Stopper og sletter containeren og sletter docker-image
	@docker stop boilerplate-web || true
	@docker rm boilerplate-web || true
	@docker rmi boilerplate-web:latest || true

status:		## Viser containerstatus
	@docker ps -a

logs:		## Viser loggene til boilerplate-web
	@docker logs boilerplate-web

shell:		## Koble til containerens shell
	@docker exec -it boilerplate-web /bin/bash
