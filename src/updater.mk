# Generate a default .gitmodule file
.gitmodules:
	@$(TOUCH) .gitmodules

# Generates a default makefile directory
$(MAKEFILE_PREFIX):
	@$(MKDIRP) $(MAKEFILE_PREFIX)

override _self_add_module = $(or $(name), $(notdir $(url)), '')

# Add a gitmodule into `makefiles/`. This module will be automatically include if contains `*.mk`
#
# Example : make self-add url=https://github.com/ianstormtaylor/makefile-help
#
.PHONY: self-add
## url=<url> [name=<string>] Add a makefile module (as git submodule)
self-add: .gitmodules $(MAKEFILE_PREFIX)
	@$(GIT) submodule add \
		--force \
		--name \
		${_self_add_module} \
		$(url) \
		$(MAKEFILE_PREFIX)/${_self_add_module}

# This target will
# 1. Update makefile/core.mk
# 2. Update all submodules
#
# Example : make self-update
#
.PHONY: self-update
## Update all makefile modules
self-update: $(MAKEFILE_PREFIX)
ifdef update
# Actual update
	$(info Updating makefile modules...)
	@$(GIT) submodule update
	$(info Update finished)
else
# Update kernel
	$(info Updating $(MAKEFILE_CORE) from git...)
	@-$(CURL) -fsSL $(MAKEFILE_UPDATER_URL) --output $(MAKEFILE_CORE)
	@$(MAKE) -f $(firstword $(MAKEFILE_LIST)) self-update update=true
endif
