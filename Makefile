.PHONY: build
build:
	@ script/build

.PHONY: test
test: build
	@ script/test

.PHONY: test-update
test-update: build
	@ UPDATE_SNAPSHOT=1 script/test
