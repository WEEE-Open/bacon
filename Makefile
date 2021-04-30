.PHONY:
destroy:
	docker-compose down --volume 	|| true
	docker container rm bacula-dir	|| true
	docker container rm bacula-db	|| true
	docker container rm bacula-sd	|| true
	docker container rm bacula-fd	|| true

.PHONY:
build: destroy $(wildcard docker/**/*)
	docker-compose build --no-cache

.PHONY:
up:
	docker-compose up -d

.PHONY:
down:
	docker-compose down

# Aliases
.PHONY:
rebuild: build up