#
# Include Makefile.local if it exists
#
-include $(MAKEFILE_LOCAL)

#
# Includes every makefiles configured by MAKEFILE_INCLUDE excluding MAKEFILE_EXCLUDE
#
include $(filter-out $(MAKEFILE_EXCLUDE),$(MAKEFILE_INCLUDE))
