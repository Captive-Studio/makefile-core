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
assert "$MAKE_TEST stub-lowercase input='HeLlO wOrLd'" "hello world"
# uppercase
assert "$MAKE_TEST stub-uppercase input='HeLlO wOrLd'" "HELLO WORLD"
# slugify
assert "$MAKE_TEST stub-slugify input='This is a title_blah!'" "this-is-a-title-blah-"
# log
assert "$MAKE_TEST stub-log level=warn message='Hello world!'" "=!=   Hello world!"
assert "$MAKE_TEST stub-log level=info message='Hello world!'" "=i=   Hello world!"
# filter-false
assert "$MAKE_TEST stub-filter-false input=false" ""
assert "$MAKE_TEST stub-filter-false input=true" "true"

assert "$MAKE_TEST stub-filter-false input=0" ""
assert "$MAKE_TEST stub-filter-false input=1" "1"

assert "$MAKE_TEST stub-filter-false input=no" ""
assert "$MAKE_TEST stub-filter-false input=yes" "yes"

assert "$MAKE_TEST stub-filter-false input=" ""
assert "$MAKE_TEST stub-filter-false input=foo" "foo"

# assert_raises "$MAKE_TEST self-update" 0
assert_end
