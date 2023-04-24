
#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
# VARIABLES
# @see src/variables.mk
#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

# Directory containing all makefiles
MAKEFILE_PREFIX := ./makefiles
# URL to the updater script
MAKEFILE_CORE := $(MAKEFILE_PREFIX)/core.mk
# URL to the updater script
MAKEFILE_UPDATER_URL := https://raw.githubusercontent.com/Captive-Studio/makefile-core/main/module.mk
## Makefiles to be included (default "makefiles/*/Makefile", "makefiles/*/*.{mk,make}")
MAKEFILE_INCLUDE ?= $(wildcard $(MAKEFILE_PREFIX)/*/Makefile) $(wildcard $(MAKEFILE_PREFIX)/*/*.make) $(wildcard $(MAKEFILE_PREFIX)/*/*.mk)
## Makefiles to be excluded (default "makefiles/_kernel.mk")
MAKEFILE_EXCLUDE ?= $(MAKEFILE_CORE) # Filtrer les fichiers qui commencent par "_"

# Binaries
CAT := cat
CD := cd
CHMOD := chmod
CP := cp
CURL := curl
FALSE := false
FIND := find
GIT := git
GREP := grep -E
LN := ln
LS := ls
MKDIRP := mkdir -p
MV := mv
NOFAIL := 2>$(NULL) || $(TRUE)
NPM := npm
NULL := /dev/null
PWD := pwd
RM := rm
SED := sed
TAIL := tail
TOUCH := touch
TRUE := true
# SHELL := $(shell bash --version >$(NULL) 2>&1 && echo bash|| echo sh)


ifeq ($(CWD),)
  CWD := $(shell pwd)
endif



#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
# UPDATER
# @see src/updater.mk
#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

# Generate a default .gitmodule file
.gitmodules:
	@touch .gitmodules

# Generates a default makefile directory
$(MAKEFILE_PREFIX):
	@$(MKDIRP) $(MAKEFILE_PREFIX)

override _self_add_module = $(or $(name), $(notdir $(url)), '')

# Add git submodule
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
#
## Update all makefile modules
.PHONY: self-update
self-update: $(MAKEFILE_PREFIX)
	echo $(firstword $(MAKEFILE_LIST))
ifdef update
# Actual update
	$(info Updating makefile modules...)
	@git submodule update
	$(info Update finished)
else
# Update kernel
	$(info Updating $(MAKEFILE_CORE) from git...)
	@-$(CURL) -fsSL $(MAKEFILE_UPDATER_URL) --output $(MAKEFILE_CORE)
	@$(MAKE) -f $(firstword $(MAKEFILE_LIST)) self-update update=true
endif

