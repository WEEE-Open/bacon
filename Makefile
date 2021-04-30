.PHONY:
destroy:
	docker-compose down --volume || true
	docker container rm bacula-dir
	docker container rm bacula-db

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