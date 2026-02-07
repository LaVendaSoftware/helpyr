GEM_TO_PUSH = `ls helpyr*.gem | tail -n 1`

release:
	bin/release

build:
	gem build helpyr.gemspec

publish:
	@echo "gem push ${GEM_TO_PUSH}"
	@gem push ${GEM_TO_PUSH}
