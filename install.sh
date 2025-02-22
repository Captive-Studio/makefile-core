#!/usr/bin/env bash

# Stop when errors
set -euo pipefail

MAKEFILES_PREFIX=".modules"
MAKEFILECORE_FILE="$MAKEFILES_PREFIX/core.mk"
MAKEFILE_CORE_URL=https://raw.githubusercontent.com/Captive-Studio/makefile-core/main/core.mk
INCLUDE_TEMPLATE="include $MAKEFILECORE_FILE"

# Download core module
mkdir -p $MAKEFILES_PREFIX
curl -fsSL -o "$MAKEFILECORE_FILE" "$MAKEFILE_CORE_URL"

# Update Makefile
touch Makefile

if ! grep "$INCLUDE_TEMPLATE" Makefile > /dev/null; then
  MAKEFILE_CONTENT=$(cat Makefile)
  cat << EOF > Makefile
# Include custom variables
-include config.mk

# Include custom local variables
# ⚠️ This file should never be versioned
-include local.mk

# Include Core
$INCLUDE_TEMPLATE
$MAKEFILE_CONTENT
EOF

fi

if [[ ! -f config.mk ]]; then
  cat << EOF > config.mk
# Makefile configuration

# Upstream for core.mk used by make self-update
export MAKEFILE_CORE_URL := $MAKEFILE_CORE_URL

# Project name (ex: vesta)
# export CI_PROJECT_NAME ?= <TODO>

# Project namespace (ex: Captive-Studio)
# export CI_PROJECT_NAMESPACE ?= <TODO>
EOF

fi
