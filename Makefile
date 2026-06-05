.DEFAULT_GOAL := help

.PHONY: help serve build
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

serve: ## Run Hugo locally (including drafts)
	hugo server --buildDrafts --disableFastRender

build: ## Build the site into ./public
	hugo --gc
