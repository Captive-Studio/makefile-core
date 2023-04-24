# Directory containing all makefiles
MAKEFILE_PREFIX := ./makefiles
# URL to the updater script
MAKEFILE_CORE := $(MAKEFILE_PREFIX)/makefile-core.mk
# URL to the updater script
MAKEFILE_UPDATER_URL := https://raw.githubusercontent.com/Captive-Studio/makefile-core/main/module.mk
## Makefiles to be included (default "makefiles/*/Makefile", "makefiles/*/*.{mk,make}")
MAKEFILE_INCLUDE ?= $(wildcard $(MAKEFILE_PREFIX)/*/Makefile) $(wildcard $(MAKEFILE_PREFIX)/*/*.make) $(wildcard $(MAKEFILE_PREFIX)/*/*.mk)
## Makefiles to be excluded (default "makefiles/_kernel.mk")
MAKEFILE_EXCLUDE ?= $(MAKEFILE_CORE) # Filtrer les fichiers qui commencent par "_"

# Curl binary
CURL := curl
