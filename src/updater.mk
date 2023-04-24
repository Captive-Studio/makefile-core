# Generate a default .gitmodule file
.gitmodules:
	@touch .gitmodules

# Generates a default makefile directory
$(MAKEFILE_PREFIX):
	@mkdir -p $(MAKEFILE_PREFIX)

override _self_add_module = $(or $(name), $(notdir $(url)), '')

$(MAKEFILE_PREFIX)/$(_self_add_module): .gitmodules $(MAKEFILE_PREFIX)
	@git submodule add \
		--force \
		--name \
		${_self_add_module} \
		$(url) \
		$(MAKEFILE_PREFIX)/${_self_add_module}


# Add a gitmodule into `makefiles/`. This module will be automatically include if contains `*.mk`
#
# Example : make self-add url=https://github.com/ianstormtaylor/makefile-help

## url=<url> [name=<string>] Add a makefile module (as git submodule)
.PHONY: self-add
self-add: makefiles/$(_self_add_module)


# This target will
# 1. Update makefile/core.mk
# 2. Update all submodules
#
# Example : make self-update

## Update all makefile modules
.PHONY: self-update
self-update:
ifdef update
# Actual update
	@git submodule update
	$(info Update finished)
else
# Update kernel
	$(info Pulling change...)
	@-$(CURL) $(MAKEFILE_UPDATER_URL) --output $(MAKEFILE_CORE)
	@$(MAKE) self-update update=true
endif

