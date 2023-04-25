#
# Includes every makefiles configured by MAKEFILE_INCLUDE excluding MAKEFILE_EXCLUDE
#
include $(filter-out $(MAKEFILE_EXCLUDE),$(MAKEFILE_INCLUDE))

#
# Include Makefile.local if it exists
#
# /!\ WARNING : this must be at the end of all files
-include $(MAKEFILE_LOCAL)
