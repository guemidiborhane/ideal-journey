user := $(shell id -u)
group := $(shell id -g)
dc := USER_ID=$(user) GROUP_ID=$(group) docker-compose -f docker-compose.yml -f docker-compose.dev.yml
dr := $(dc) run --rm
de := $(dc) exec

.PHONY: fish
fish: ## Run fish shell
	$(dr) php /usr/bin/fish
