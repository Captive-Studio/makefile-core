assert "make --makefile Makefile.test test-included" 'test-included-done'
assert_raises "make --makefile Makefile.test self-update" 0

assert_snapshot "make --makefile Makefile.test help" "make_help.out"
assert_end
