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

# Directory containing all makefiles
MAKEFILE_PREFIX := ./makefiles
# URL to the updater script
MAKEFILE_CORE := $(MAKEFILE_PREFIX)/core.mk
# URL to the updater script
MAKEFILE_UPDATER_URL := https://raw.githubusercontent.com/Captive-Studio/makefile-core/main/core.mk
## Makefiles to be included (default "makefiles/*/Makefile", "makefiles/*/*.{mk,make}")
MAKEFILE_INCLUDE ?= $(wildcard $(MAKEFILE_PREFIX)/*/Makefile) $(wildcard $(MAKEFILE_PREFIX)/*/*.make) $(wildcard $(MAKEFILE_PREFIX)/*/*.mk)
## Makefiles to be excluded (default "makefiles/_kernel.mk")
MAKEFILE_EXCLUDE ?= $(MAKEFILE_CORE) # Filtrer les fichiers qui commencent par "_"
## Optional Makefile loaded to override locally any value (default "Makefile.local")
MAKEFILE_LOCAL ?= Makefile.local

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
