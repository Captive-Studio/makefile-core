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

HELP_COLOR_FLAGS := # "$(BLUE)"
HELP_COLOR_TARGETS := # "$(YELLOW)"
HELP_COLOR_RESET := # "$(RESET)"

.PHONY: help
help:: ## Show this help.
	@echo ""
	@echo "  Usage:"
	@echo ""
	@echo "    make ${HELP_COLOR_TARGETS}<target>${HELP_COLOR_RESET} ${HELP_COLOR_FLAGS}[flags...]${HELP_COLOR_RESET}"
	@echo ""
	@echo "  Targets:"
	@echo ""
	@sed \
		-e '/^[a-zA-Z0-9_\-]*:.*##/!d' \
		-e 's/:.*##\s*/:/' \
		-e 's/^\(.\+\):\(.*\)/$(HELP_COLOR_TARGETS)\1$(HELP_COLOR_RESET):\2/' \
		-e 's/\(.*\)/    \1/' \
		$(MAKEFILE_LIST) | column -c2 -t -s : | sort
# @awk '/^##/{ comment = substr($$0,4) } /^[a-zA-Z][a-zA-Z0-9_-]+:/{ if (!match($$0, / ?= ?/)) print "   ", $$1, comment }' $(MAKEFILE_LIST) | column -t -s ':' | sort
	@echo ''
	@echo '  Flags:'
	@echo ''
	@awk '/^##/{ comment = substr($$0,4) } /^[a-zA-Z][a-zA-Z0-9_-]+ ?\?=/{ sub(/\?\=/, "", $$2); printf "    %-24s%s\n", $$1, $$2 " " comment }' $(MAKEFILE_LIST) | sort
	@echo ''
