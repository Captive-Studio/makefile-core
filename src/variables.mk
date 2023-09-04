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

# PHONY default value is empty
ifeq ($(PHONY),)
  PHONY :=
endif

# Directory containing all git modules
GIT_MODULES_DIR := ./.modules
# URL to the updater script
MAKEFILE_CORE := $(GIT_MODULES_DIR)/core.mk
# URL to the updater script
MAKEFILE_UPDATER_URL := https://raw.githubusercontent.com/Captive-Studio/makefile-core/main/core.mk
## Makefiles to be included (default ".modules/*/Makefile", ".modules/*/*.{mk,make}")
MAKEFILE_INCLUDE ?= $(wildcard $(GIT_MODULES_DIR)/*/*.make) $(wildcard $(GIT_MODULES_DIR)/*/*.mk)
## Makefiles to be excluded (default ".modules/_kernel.mk")
MAKEFILE_EXCLUDE ?= $(MAKEFILE_CORE) # Filtrer les fichiers qui commencent par "_"
## Optional Makefile loaded to override locally any value (default "Makefile.local")
MAKEFILE_LOCAL ?= Makefile.local

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
SHELL := /bin/bash
TAIL := tail
TOUCH := touch
TRUE := true

ifeq ($(CWD),)
  CWD := $(shell pwd)
endif

# Define default goal to help
ifeq ($(.DEFAULT_GOAL),)
  .DEFAULT_GOAL := help
endif

# Declare the contents of the PHONY variable as phony
# We use a variable so we can manipulate it easily
.PHONY: $(PHONY)
