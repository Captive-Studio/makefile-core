.PHONY: build
build:
	@ script/build

.PHONY: test
test: build
	@ script/test
