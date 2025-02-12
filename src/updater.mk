MODULES_FILE := module.json

.self_add_module=$(or $(name), $(notdir $(url)), '')

# Returns a list of all module names from the modules.json file.
#
# Usage:
#   make self-list
#
.PHONY: self-list
self-list: ## List all installed modules (in module.json)
	$(Q)if [ ! -f "$(MODULES_FILE)" ]; then \
		$(call panic,$(MODULES_FILE) does not exist. Try make self-add to add modules.); \
	fi
	$(Q)$(JQ) -r 'keys[]' $(MODULES_FILE)

# Returns a list of all module names from the modules.json file.
#
# Usage:
#   make self-add name=<string> url=<git-repository>
#
# Example:
#   make self-add name=makefile-ci url=https://github.com/Captive-Studio/makefile-ci
#
.PHONY: self-add
self-add: $(MODULES_PATH) ## url=<git-repository> [name=<string>] Install a module in .modules/ (using git subtree)
	$(Q)if [ -z "$(.self_add_module)" ] || [ -z "$(url)" ]; then \
		$(call panic,Usage: make self-add name=<string> url=<git-repository>); \
	fi
# Create folder
	$(Q)$(MKDIRP) $(MODULES_PATH)
# Check if module is already present
	$(Q)if $(JQ) -e '.["$(.self_add_module)"]' $(MODULES_FILE) &>/dev/null; then \
		$(call panic,$(.self_add_module) already present in $(MODULES_FILE)); \
	elif [ -d "$(MODULES_PATH)/$(.self_add_module)" ]; then \
		$(call panic,$(MODULES_PATH)/$(.self_add_module) should be empty); \
	fi

# Linking repository
	@$(call log,info,[Make] Adding subtree: $(.self_add_module) from $(url),0);
	$(Q)$(GIT) subtree add --prefix=$(MODULES_PATH)/$(.self_add_module) $(url) main --squash;
# git commit -m "chore(subtree): add $(name) from $(repo)";

# Create empty file if it does not exist
	$(Q)if [ ! -f "$(MODULES_FILE)" ]; then \
		echo "{}" > $(MODULES_FILE); \
	fi

# Edit module.json file
	$(Q)echo "Adding $(.self_add_module) to $(MODULES_FILE)";
	$(Q)$(JQ) \
		'.["$(.self_add_module)"] = "$(url)"' \
		$(MODULES_FILE) > $(MODULES_FILE).tmp \
	&& mv $(MODULES_FILE).tmp $(MODULES_FILE)


# This target will
# 1. Update makefile/core.mk
# 2. Update all submodules
#
# Example : make self-update
#
.PHONY: self-update
self-update: ## Update all modules (in .modules/)
ifdef update
# Actual update
	@$(call log,info,[Make] Updating $(MODULES_PATH)/* ...,0)

ifeq ($(wildcard $(MODULES_FILE)),)
# No module.json found
	@$(call log,warn,[Make] Update skipped (no module.json found),0)
else
# module.json found
	$(Q)$(JQ) -r 'to_entries[] | "\(.key) \(.value)"' $(MODULES_FILE) | while read name repo; do \
		$(call log,info,>> $$name,1); \
		git subtree pull --prefix=$(MODULES_PATH)/$$name $$repo main --squash; \
	done
	@$(call log,info,[Make] Update finished,0)
endif

else
# Update kernel
	@$(call log,info,[Make] Updating $(MAKEFILE_CORE) from git...,0)
	$(Q)-$(CURL) -fsSL $(MAKEFILE_CORE_URL) --output $(MAKEFILE_CORE)

	$(Q)$(MAKE) $(MAKEFILE_CORE)
	$(Q)$(MAKE) -f $(firstword $(MAKEFILE_LIST)) self-update update=true
endif

# Temporary file
MAKEFILE_CORE_TMP := $(MAKEFILE_CORE).tmp

# Target for makefile core
$(MAKEFILE_CORE): FORCE
	$(Q)-$(CURL) -sSfL "$(MAKEFILE_CORE_URL)" -o "$(MAKEFILE_CORE_TMP)"
	$(Q)if [ ! -f "$(MAKEFILE_CORE)" ] || ! cmp -s "$(MAKEFILE_CORE_TMP)" "$(MAKEFILE_CORE)"; then \
		mv "$(MAKEFILE_CORE_TMP)" "$(MAKEFILE_CORE)"; \
		touch "$(MAKEFILE_CORE)"; \
	fi
	$(Q)-$(RM) -f "$(MAKEFILE_CORE_TMP)";
