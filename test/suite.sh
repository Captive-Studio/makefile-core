MAKE_TEST="make --makefile Makefile.test.mk --no-print-directory"
_TERM=$TERM

unset TERM;
assert "$MAKE_TEST test-included" 'test-included-done'

# FIXME:
# assert_snapshot "$MAKE_TEST print-variables" "make_print-variables.out"
assert_snapshot "$MAKE_TEST help" "make_help.out"
assert_snapshot "$MAKE_TEST" "make_default_help.out"

assert "$MAKE_TEST print-BUNDLE" "bundle"

assert "$MAKE_TEST VERBOSE=true print-BUNDLE" "bundle"

# lowercase
assert "$MAKE_TEST stub-lowercase" "hello world"
# uppercase
assert "$MAKE_TEST stub-uppercase" "HELLO WORLD"
# log
assert "$MAKE_TEST stub-log" "=!=   Hello world!"

# assert_raises "$MAKE_TEST self-update" 0
assert_end
