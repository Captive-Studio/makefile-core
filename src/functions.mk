# Return a newline character
#
# Example:
#   $(newline)
define newline


endef

# Escape a shell string passed as a single quoted string
#
# Usage:
# 	$(call escape-shell,<string>)
#
# Example:
#  embeddable-text = $(call escape-shell,$(SOME_TEXT))
#
escape-shell = $(subst $(newline),\$(newline),$(subst ','\'',$(1)))

# Lower-case a string value.
#
# Usage:
# 	$(call lowercase,<string>)
#
# Example:
# 	$(call lowercase,HeLlO wOrLd) # "hello world"
lowercase = $(shell echo $(call escape-shell,$(1)) | tr '[:upper:]' '[:lower:]')

