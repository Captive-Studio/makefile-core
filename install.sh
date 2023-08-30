#!/usr/bin/env bash

# Stop when errors
set -e

MAKEFILES_PREFIX=".modules"
MAKEFILECORE_FILE="$MAKEFILES_PREFIX/core.mk"
INCLUDE_TEMPLATE="include $MAKEFILECORE_FILE"

# Download core module
mkdir -p $MAKEFILES_PREFIX
curl -fsSL -o "$MAKEFILECORE_FILE" https://raw.githubusercontent.com/Captive-Studio/makefile-core/main/core.mk

# Update Makefile
touch Makefile
if ! grep "$INCLUDE_TEMPLATE" Makefile; then
  echo -e "$INCLUDE_TEMPLATE\n\n$(cat Makefile)" > Makefile
fi
