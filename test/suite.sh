MAKE_TEST="make --makefile Makefile.test --no-print-directory"
_TERM=$TERM

unset TERM;
assert "$MAKE_TEST test-included" 'test-included-done'

# FIXME:
# assert_snapshot "$MAKE_TEST print-variables" "make_print-variables.out"
assert_snapshot "$MAKE_TEST help" "make_help.out"
assert_snapshot "$MAKE_TEST" "make_default_help.out"

assert "$MAKE_TEST print-BUNDLE" "bundle"

# assert_raises "$MAKE_TEST self-update" 0
assert_end
