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
