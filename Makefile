.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install everything
	@command -v ruby >/dev/null 2>&1 || { echo >&2 "I require ruby but it's not installed. Aborting."; exit 1; }
	@command -v bundle >/dev/null 2>&1 || gem install bundler;
	bundle install

debug:  ## Run Jekyll in debug mode
	bundle exec jekyll serve --watch --drafts
	
github: ## Run Jekyll as if it was build on github
	bundle exec jekyll serve --watch --safe
	
test: ## Run tests
	bundle exec jekyll build --safe
	bundle exec htmlproofer ./_site --check-html --assume-extension ./_site --only-4xx
