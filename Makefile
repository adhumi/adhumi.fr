install:
	@command -v ruby >/dev/null 2>&1 || { echo >&2 "I require ruby but it's not installed. Aborting."; exit 1; }
	@command -v bundle >/dev/null 2>&1 || gem install bundler;
	bundle install

debug:
	bundle exec jekyll serve --watch --drafts
	
github:
	bundle exec jekyll serve --watch --safe
	
test:
	bundle exec jekyll build --safe
	bundle exec htmlproofer ./_site --check-html --assume-extension ./_site --only-4xx
