include ../core.mk

## test=true Test Flag Root
TEST_FLAG_ROOT ?= test-flag-root

TEST_FLAG_ROOT_NO_HELP ?=

test-root: ## test=true Test included root

test-root-no-help:

.PHONY: $(filter test-%,$(MAKECMDGOALS)))
test-lowercase:
	@echo $(call lowercase,HeLlO wOrLd)
