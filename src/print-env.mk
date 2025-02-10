define .VARIABLES_ENV
$(foreach V,$(.VARIABLES), \
	$(if $(filter-out environment% default automatic, $(origin $V)), $V) \
)
endef

.PHONY: env
print-env: .before_each ## Display all env variables exported by make
	@env | \
    grep -E "^($(shell echo $(.VARIABLES_ENV) | tr ' ' '|'))=" | \
    sort -f
