# Generate a default .gitmodule file
.gitmodules:
	@$(TOUCH) .gitmodules

# Generates a default makefile directory
$(MODULES_PATH): self-install

.self_add_module=$(or $(name), $(notdir $(url)), '')

# Install .modules
#
# Example : make self-install
#
.PHONY: self-install
self-install: ## Install makefile modules
	@$(MKDIRP) $(MODULES_PATH)
	@$(GIT) submodule sync
	@$(GIT) submodule update --init --recursive

# Add a gitmodule into `.modules/`. This module will be automatically include if contains `*.mk`
#
# Example : make self-add url=https://github.com/ianstormtaylor/makefile-help
#
.PHONY: self-add
self-add: .gitmodules $(MODULES_PATH) ## url=<url> [name=<string>] Add a makefile module (as git submodule)
	@$(GIT) submodule add \
		--force \
		--name \
		$(.self_add_module) \
		$(url) \
		$(MODULES_PATH)/$(.self_add_module)

# This target will
# 1. Update makefile/core.mk
# 2. Update all submodules
#
# Example : make self-update
#
.PHONY: self-update
self-update: $(MODULES_PATH) ## Update all makefile modules
ifdef update
# Actual update
	$(info Updating makefile modules...)
	@$(GIT) submodule update --init --remote --recursive
	$(info Update finished)
else
# Update kernel
	$(info Updating $(MAKEFILE_CORE) from git...)
	@-$(CURL) -fsSL $(MAKEFILE_UPDATER_URL) --output $(MAKEFILE_CORE)
	@$(MAKE) -f $(firstword $(MAKEFILE_LIST)) self-update update=true
endif
