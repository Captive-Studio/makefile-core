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
  MAKEFILE_CONTENT=$(cat Makefile)
  cat << EOF > Makefile
# Include custom variables
-include config.mk

# Include Core
$INCLUDE_TEMPLATE
$MAKEFILE_CONTENT
EOF

fi
if [[ ! -f config.mk]]; then
  cat << EOF > config.mk
# Configure custom variables
# Hint:
#   Use \`make help\` and \`make print-variables\` to know which variable is available
#
# Example :
#   CI_PROJECT_NAME ?= my-custom-name
EOF
fi
