.PHONY:
template:
	if [ ! -f ".env" ]; then cp sample.env .env; fi

.PHONY:
destroy:
	docker-compose down --volume 	|| true
	docker container rm bacula-dir	|| true
	docker container rm bacula-db	|| true
	docker container rm bacula-sd	|| true
	docker container rm bacula-fd	|| true

.PHONY:
build: destroy template $(wildcard docker/**/*)
	docker-compose build --no-cache

.PHONY:
up: template
	docker-compose up -d

.PHONY:
down:
	docker-compose down

.PHONY:
rebuild: build up
