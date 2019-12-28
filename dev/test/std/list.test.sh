# shellcheck shell=bash
# eval "$(curl https://x-bash.github.io/boot)"

@src std/list std/utils std/assert

list.test(){
    list.new test

    @catch-final "
        echo catch error: codeline \$LINENO
    " "
        # echo before free
        test.free
        # aaa # Wrong command
        # echo after free
    "

    test.push a b c d e f

    assert.eq "$(test.first default)" "a"
    assert.eq "$(test.top default)" "f"

    # assert.eq "$(test.first default)" "a1"
    # assert.eq "$(test.first default)" "a2"

    test.shift
    assert.eq "$(test.first default)" "b"
    assert.eq "$(test.top default)" "f"

    test.pop
    assert.eq "$(test.first default)" "b"
    assert.eq "$(test.top default)" "e"
}