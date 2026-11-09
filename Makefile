COMPOSE := $(shell if docker compose version >/dev/null 2>&1; then printf '%s' "docker compose"; else printf '%s' "docker-compose"; fi)

.PHONY: build test typecheck check

build:
	$(COMPOSE) build

test: build
	$(COMPOSE) run --rm dev pytest -q

typecheck: build
	$(COMPOSE) run --rm dev mypy src tests

check: test typecheck
