include ../core.mk

## test=true Test Flag Root
TEST_FLAG_ROOT ?= test-flag-root

TEST_FLAG_ROOT_NO_HELP ?=

test-root: ## test=true Test included root

test-root-no-help:

.PHONY: $(filter stub-%,$(MAKECMDGOALS)))
stub-lowercase:
	$(Q)echo $(call lowercase,HeLlO wOrLd)

stub-uppercase:
	$(Q)echo $(call uppercase,HeLlO wOrLd)

stub-log:
	$(Q)$(call log,warn,Hello world!,1)

stub-filter-false:
	$(Q)echo filter-false,1=$(call filter-false,1)
	$(Q)echo filter-false,0=$(call filter-false,0)

	$(Q)echo filter-false,''=$(call filter-false,)
	$(Q)echo filter-false,foo=$(call filter-false,foo)

	$(Q)echo filter-false,false=$(call filter-false,false)
	$(Q)echo filter-false,true=$(call filter-false,true)

	$(Q)echo filter-false,no=$(call filter-false,no)
	$(Q)echo filter-false,yes=$(call filter-false,yes)
