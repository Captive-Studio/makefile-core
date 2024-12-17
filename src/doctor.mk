# Display a diagnostic of common errors
#
# To add a new check just create a new target and append to .doctor target
# .my-target:
#   //...
# .doctor:: .my-target
#
# Example : make doctor
#
.PHONY: doctor
doctor: ## Check your system for potential problems.
	@$(call log,info,"[Make] Doctor")
	$(Q)if $(MAKE) .doctor; then \
		$(call log,info,"🎉 Everything is OK",1); \
	else \
		$(call log,fatal,"❌ Some problems need to be fixed",1); \
		exit 1; \
	fi

.PHONY: git-submodules.doctor
git-submodules.doctor:
	@$(call log,info,"✓ Checking git submodules",1);
	$(Q)if [ ! -f .gitmodules ]; then \
		exit 0; \
	fi
	$(Q)MISSING=$$(grep path .gitmodules | sed 's/.*= //' | xargs -n 1 sh -c 'test ! -d "$$0" && echo $$0'); \
	if [ -n "$$MISSING" ]; then \
		$(call log,error,Some git submodules are not installed,2); \
		$(call log,error,Run 'make self-install to fix.',2); \
		exit 1; \
	fi
.doctor:: git-submodules.doctor
