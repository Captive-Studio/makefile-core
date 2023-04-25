
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

## Show this help prompt.
.PHONY: help
help:
	@ echo
	@ echo '  Usage:'
	@ echo ''
	@ echo '    make <target> [flags...]'
	@ echo ''
	@ echo '  Targets:'
	@ echo ''
	@ awk '/^##/{ comment = substr($$0,4) } /^[a-zA-Z][a-zA-Z0-9_-]+:/{ if (!match($$0, / ?= ?/)) print "   ", $$1, comment }' $(MAKEFILE_LIST) | column -t -s ':' | sort
	@ echo ''
	@ echo '  Flags:'
	@ echo ''
	@ awk '/^##/{ comment = substr($$0,4) } /^[a-zA-Z][a-zA-Z0-9_-]+ ?\?=/{ print "   ", $$1, $$2, comment }' $(MAKEFILE_LIST) | column -t -s '?=' | sort
	@ echo ''






