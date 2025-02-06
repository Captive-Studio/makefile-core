#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
# Makefile core module
#
# <https://github.com/Captive-Studio/makefile-core>
#
# DO NOT EDIT!
# Generated by the script/build.sh script.
#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
# CONSOLE
# @see src/console.mk
#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

# Terminal colors

ifneq ($(TERM),)
  BOLD         := $(shell tput bold)
	BLACK        := $(shell tput setaf 0)
	RED          := $(shell tput setaf 1)
	GREEN        := $(shell tput setaf 2)
	YELLOW       := $(shell tput setaf 3)
	LIGHTPURPLE  := $(shell tput setaf 4)
	PURPLE       := $(shell tput setaf 5)
	BLUE         := $(shell tput setaf 6)
	WHITE        := $(shell tput setaf 7)
	RESET        := $(shell tput sgr0)
	SMUL         := $(shell tput smul)
	RMUL         := $(shell tput rmul)
else
	BOLD         :=
	BLACK        :=
	RED          :=
	GREEN        :=
	YELLOW       :=
	LIGHTPURPLE  :=
	PURPLE       :=
	BLUE         :=
	WHITE        :=
	RESET        :=
	SMUL         :=
	RMUL      	 :=
endif

#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
# FUNCTIONS
# @see src/functions.mk
#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

# Return a newline character
#
# Example:
#   $(newline)
define newline


endef

# Escape a shell string passed as a single quoted string
#
# Usage:
# 	$(call escape-shell,<string>)
#
# Example:
#  embeddable-text = $(call escape-shell,$(SOME_TEXT))
#
escape-shell = $(subst $(newline),\$(newline),$(subst ','\'',$(1)))

# Lower-case a string value.
#
# Usage:
# 	$(call lowercase,<string>)
#
# Example:
# 	$(call lowercase,HeLlO wOrLd) # "hello world"
lowercase = $(shell echo $(call escape-shell,$(1)) | tr '[:upper:]' '[:lower:]')


#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
# LOG
# @see src/log.mk
#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯


# Externally define log levels
export LOG_DEBUG := 0
export LOG_INFO := 1
export LOG_WARN := 2
export LOG_ERROR := 3
export LOG_FATAL := 4

## Set the log level (debug/info/warn/error/fatal default:info)
LOG_LEVEL ?= info
export LOG_LEVEL

# Define some commonly used values in log strings
LOG_HEADER_DEBUG := -d-
LOG_HEADER_INFO := =i=
LOG_HEADER_WARN := =!=
LOG_HEADER_ERROR := =!=
LOG_HEADER_FATAL := !!!

# Defined in makefile-core
LOG_COLOR_DEBUG := $(PURPLE)
LOG_COLOR_INFO := $(BLUE)
LOG_COLOR_WARN := $(YELLOW)
LOG_COLOR_ERROR := $(RED)
LOG_COLOR_FATAL := $(RED)

#define some useful macros
__log_to_upper = $(shell echo $(1) | tr '[:lower:]' '[:upper:]')
# __log_to_lower = $(shell echo $(1) | tr '[:upper:]' '[:lower:]')

# Define the logging macros

define __log_generic
([ $(LOG_$(call __log_to_upper,$(LOG_LEVEL))) -gt $(2) ] || echo "$(log_bold)$(3)$(4) $(5)$(1)$(RESET)")
endef

# Log a message to console
#
# Usage:
#   $(call log,<level>,<message>,<indent_level>)
#
# Example:
# 	@$(call log,info,"[MyCategory] Install something...",0)
# 	@$(call log,info,"[MyCategory] Sub command with indent...",1)
#
define log
$(call __log_generic,$(2),$(LOG_$(call __log_to_upper,$(1))),$(LOG_COLOR_$(call __log_to_upper,$(1))),$(LOG_HEADER_$(call __log_to_upper,$(1))),$(shell [ "$(or $(3),0)" = 0 ] || for i in $(shell seq 1 $(or $(3),0)); do echo -n '  '; done))
endef

# Log a message with fatal level and exit program
#
# Usage:
#   $(call panic,<message>)
# Example:
# 	$(call panic,Something wrong happened !)
#
define panic
	$(call log,fatal,$(1))
	exit 1
endef

#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
# VARIABLES
# @see src/variables.mk
#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

# Disable built-in rules and variables
# (this increases performance and avoids hard-to-debug behaviour);
MAKEFLAGS += -rR

# Avoid messages "Entering directory ..."
MAKEFLAGS += --no-print-directory

# Avoid funny character set dependencies
unexport LC_ALL
LC_COLLATE=C
LC_NUMERIC=C
export LC_COLLATE LC_NUMERIC

## Set the make output as verbose
VERBOSE ?= false

# Read uname (Linux|Darwin|...|Unknown)
UNAME := $(shell uname 2>/dev/null || echo Unknown)

# Binaries
BUNDLE := bundle
CAT := cat
CD := cd
CHMOD := chmod
CP := cp
CURL := curl
DOCKER := docker
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

# Quiet flag. The command will be logged in console only when $(VERBOSE) is truthy
# @example
# $(Q)echo 'foo'
ifeq ($(strip $(VERBOSE)),false)
	Q=@
else
	Q=
endif

# Configure shell as bash and strict mode
SHELL := /bin/bash
.SHELLFLAGS := -eu -o pipefail -c

# Use gdate on macOS
ifeq ($(UNAME),Darwin)
	DATE := gdate
else
	DATE := date
endif

ifeq ($(CWD),)
	CWD := $(shell pwd)
endif

# Detect NPROC (number of processors)
ifeq ($(NPROC),)
NPROC := 1
ifeq ($(UNAME),Linux)
	NPROC := $(shell nproc)
else ifeq ($(UNAME),Darwin)
	NPROC := $(shell sysctl -n hw.ncpu)
endif
endif

# Directory containing all git modules
MODULES_PATH := .modules

# Makefile variables

# URL to the updater script
MAKEFILE_CORE := $(MODULES_PATH)/core.mk
## Upstream for core.mk used by make self-update
MAKEFILE_CORE_URL ?= https://raw.githubusercontent.com/Captive-Studio/makefile-core/main/core.mk
## Makefiles to be included (default ".modules/*/Makefile", ".modules/*/*.{mk,make}")
MAKEFILE_INCLUDE ?= $(wildcard $(MODULES_PATH)/*/module.make) $(wildcard $(MODULES_PATH)/*/module.mk)
## Makefiles to be excluded (default "$(MAKEFILE_CORE)")
MAKEFILE_EXCLUDE ?= $(MAKEFILE_CORE) # Filtrer les fichiers qui commencent par "_"
## Optional Makefile loaded to override locally any value (default "Makefile.local")
MAKEFILE_LOCAL ?= Makefile.local
# Main Makefile path
MAKEFILE_PATH := $(abspath $(firstword $(MAKEFILE_LIST)))

# Make current process id
export MAKE_PID := $(shell echo $$PPID)
# Make parent process id
# We allow overriding for internal implementation. The parent make command will provide to the children
ifeq ($(MAKE_PPID)),)
	MAKE_PPID := $(MAKE_PID)
endif
export MAKE_PPID

# This target will print every variables declared in $(.VARIABLES)
#
# Example : make print-variables
#
.PHONY: print-variables
print-variables: ## Print all declared variables
	@$(foreach V,$(sort $(.VARIABLES)), \
		$(if $(filter-out environment% default automatic, \
		$(origin $V)),$(info $V=$(YELLOW)"$($V)$(RESET)$(YELLOW)"$(RESET)$(if $(filter-out $(value $V), $($V)),$(BLACK) # `$(value $V)$(RESET)`,)) \
		) \
	)
	@exit 0

# This target will print a given variable
#
# Example : make print-VAR
#
.PHONY: print-%
print-%: ## Print given variable after "-" (ex: print-VAR)
	@echo $($*)

# Define default goal to help
.DEFAULT_GOAL := help

#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
# UPDATER
# @see src/updater.mk
#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

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
	$(Q)$(MKDIRP) $(MODULES_PATH)
	$(Q)$(GIT) submodule sync
	$(Q)$(GIT) submodule update --init --recursive

# Add a gitmodule into `.modules/`. This module will be automatically include if contains `*.mk`
#
# Example : make self-add url=https://github.com/ianstormtaylor/makefile-help
#
.PHONY: self-add
self-add: .gitmodules $(MODULES_PATH) ## url=<url> [name=<string>] Add a makefile module (as git submodule)
	$(Q)$(GIT) submodule add \
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
	@$(call log,info,[Make] Updating makefile modules...,0)
	$(Q)$(GIT) submodule update --init --remote --recursive
	@$(call log,info,[Make] Update finished,0)
else
# Update kernel
	@$(call log,info,[Make] Updating $(MAKEFILE_CORE) from git...,0)
	$(Q)-$(CURL) -fsSL $(MAKEFILE_CORE_URL) --output $(MAKEFILE_CORE)
	@$(MAKE) -f $(firstword $(MAKEFILE_LIST)) self-update update=true
endif

#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
# DOCTOR
# @see src/doctor.mk
#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

# Makefile doctor list of targets
MAKEFILE_DOCTOR_TARGETS :=

# Display a diagnostic of common errors
#
# To add a new check just create a new target (.doctor is a convention)
# .doctor.my-target:
#   //...
#
# MAKEFILE_DOCTOR_TARGETS += .doctor.my-target # Register target
#
# Example : make doctor
#
.PHONY: doctor
doctor: ## Check your system for potential problems.
	@$(call log,info,"[Make] Doctor")
	$(Q)FAILS=0; \
	for target in $(MAKEFILE_DOCTOR_TARGETS); do \
		$(MAKE) $$target || FAILS=1; \
	done; \
	if [ $$FAILS -eq 0 ]; then \
		$(call log,info,"🎉 Everything is OK",1); \
	else \
		$(call log,fatal,"❌ Some problems need to be fixed",1); \
		exit 1; \
	fi


# Default doctor jobs that will check if git modules were initialized
.PHONY: .doctor.git-submodules
.doctor.git-submodules:
	@$(call log,info,"✓ Checking git submodules",1);
	$(Q)if [ ! -f .gitmodules ]; then \
		exit 0; \
	fi
	$(Q)MISSING=$$(grep path .gitmodules | sed 's/.*= //' | xargs -n 1 sh -c 'test ! -d "$$0" && echo $$0'); \
	if [ -n "$$MISSING" ]; then \
		$(call log,error,Some git submodules are not installed,2); \
		$(call log,error,Run 'make self-install to fix.',2); \
		exit 1; \
	fi

MAKEFILE_DOCTOR_TARGETS += .doctor.git-submodules

#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
# HELP
# @see src/help.mk
#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

# Display a list of all available targets and flags
#
# Example : make help
#
# Example of Makefile
#
# ```makefile
# ## This is a help message
# my_target:
# ```
#

HELP_COLOR_FLAGS = $(BLUE)
HELP_COLOR_TARGETS = $(YELLOW)
HELP_COLOR_RESET = $(RESET)

.PHONY: help
help: ## Show this help
	@echo ''
	@echo '  Usage:'
	@echo ''
	@echo '    make $(HELP_COLOR_TARGETS)<target>$(HELP_COLOR_RESET) $(HELP_COLOR_FLAGS)[FLAG1=...] [FLAG2=...]$(HELP_COLOR_RESET)'
	@echo ''
	@echo '  Targets:'
	@echo ''
	@$(SED) \
		-e '/^[a-zA-Z0-9_\-]*:.*##/!d' \
		-e 's/:.*##[[:space:]]*/|/' \
		-e 's/\(.*\)|\(.*\)/$(HELP_COLOR_TARGETS)\1$(HELP_COLOR_RESET)|\2/' \
		-e 's/\(.*\)/    \1/' \
		$(MAKEFILE_LIST) | column -c2 -t -s '|' | sort
	@echo ''
	@echo '  Flags:'
	@echo ''
	@awk ' \
  /^##/ { comment = substr($$0, 4); next } \
  /^[a-zA-Z][a-zA-Z0-9_-]+ ?\?=/ && comment { \
    sub(/\?\=/, "", $$2); \
    printf "    $(HELP_COLOR_FLAGS)%s$(HELP_COLOR_RESET)|%s\n", $$1, $$2 " " comment; \
    comment = ""; \
  } \
' $(MAKEFILE_LIST) | column -c2 -t -s '|' | sort
	@echo ''

#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯
# MAIN
# @see src/main.mk
#⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯⎯

#
# Includes every makefiles configured by MAKEFILE_INCLUDE excluding MAKEFILE_EXCLUDE
#
include $(filter-out $(MAKEFILE_EXCLUDE),$(MAKEFILE_INCLUDE))

#
# Include Makefile.local if it exists
#
# /!\ WARNING : this must be at the end of all files
-include $(MAKEFILE_LOCAL)

