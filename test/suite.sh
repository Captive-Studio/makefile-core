MAKE_TEST=make --makefile Makefile.test

assert "$MAKE_TEST test-included" 'test-included-done'
assert_raises "$MAKE_TEST self-update" 0

assert_snapshot "$MAKE_TEST help" "make_help.out"
assert_snapshot "$MAKE_TEST" "make_help.out"
assert_end
