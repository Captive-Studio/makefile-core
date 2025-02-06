include ../core.mk

## test=true Test Flag Root
TEST_FLAG_ROOT ?= test-flag-root

TEST_FLAG_ROOT_NO_HELP ?=

test-root: ## test=true Test included root

test-root-no-help:

.PHONY: $(filter stub-%,$(MAKECMDGOALS)))
stub-lowercase:
	$(Q)echo $(call lowercase,$(input))

stub-uppercase:
	$(Q)echo $(call uppercase,$(input))

stub-slugify:
	$(Q)echo $(call slugify,$(input))

stub-log:
	$(Q)$(call log,$(level),$(message),1)

stub-filter-false:
	$(Q)echo $(call filter-false,$(input))
