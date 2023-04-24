# Directory containing all makefiles
MAKEFILE_PREFIX := ./makefiles
# URL to the updater script
MAKEFILE_CORE := $(MAKEFILE_PREFIX)/core.mk
# URL to the updater script
MAKEFILE_UPDATER_URL := https://raw.githubusercontent.com/Captive-Studio/makefile-core/main/include.mk
## Makefiles to be included (default "makefiles/*/Makefile", "makefiles/*/*.{mk,make}")
MAKEFILE_INCLUDE ?= $(wildcard $(MAKEFILE_PREFIX)/*/Makefile) $(wildcard $(MAKEFILE_PREFIX)/*/*.make) $(wildcard $(MAKEFILE_PREFIX)/*/*.mk)
## Makefiles to be excluded (default "makefiles/_kernel.mk")
MAKEFILE_EXCLUDE ?= $(MAKEFILE_CORE) # Filtrer les fichiers qui commencent par "_"
## Makefile to include if exist (should be ignored by git)
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
TAIL := tail
TOUCH := touch
TRUE := true
# SHELL := $(shell bash --version >$(NULL) 2>&1 && echo bash|| echo sh)


ifeq ($(CWD),)
  CWD := $(shell pwd)
endif


