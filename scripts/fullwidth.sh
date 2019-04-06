#!/bin/bash

fullwidth() {
    local readonly ARGS="$@"

    # fast_chr and unichr from: http://stackoverflow.com/a/23436040/604614
    fast_chr() {
        local __octal
        local __char
        printf -v __octal '%03o' $1
        printf -v __char \\$__octal
        REPLY="$__char"
    }

    # unichr() - prints unicode character for any size number
    # see: http://stackoverflow.com/a/16509364/604614
    function unichr {
        local c=$1  # ordinal of char
        local l=0   # byte ctr
        local o=63  # ceiling
        local p=128 # accum. bits
        local s=''  # output string

        (( c < 0x80 )) && { fast_chr "$c"; echo -n "$REPLY"; return; }

        while (( c > o )); do
            fast_chr $(( t = 0x80 | c & 0x3f ))
            s="$REPLY$s"
            (( c >>= 6, l++, p += o+1, o>>=1 ))
        done

        fast_chr $(( t = p | c ))
        echo -n "$REPLY$s"
    }

    # ord() - converts ASCII character to its decimal value
    # see: http://stackoverflow.com/a/12855787/604614
    ord() {
      printf '%d' "'$1"
    }

    fullwidth_word() {
        local word=$1
        local i
        local char_code
        local fullwidth_char_code
        local fullwith_char

        # loop over characters in word
        # see: http://stackoverflow.com/a/10552175/604614
        for (( i=0; i<${#word}; i++ )); do
            char_code="$(ord ${word:$i:1})"
            fullwidth_char_code=$((char_code + 65248))
            echo -n "$(unichr ${fullwidth_char_code})"
        done
    }

    local res=""
    local fw
    local word
    # use ideographic space for fullwidth spaces
    # see: http://stackoverflow.com/a/8333105/604614
    local fullwidth_space="$(unichr 12288)"

    for word in $ARGS; do
        fw="$(fullwidth_word $word)"
        res="$res$fullwidth_space$fw"
    done

    res="${res:1}"             # trim leading space, hacky, all well
    echo "$res"                # print to the terminal too because ¯\_(ツ)_/¯

    # delete our inner functions: http://stackoverflow.com/a/23653825/604614
    unset -f fast_chr
    unset -f unichr
    unset -f ord
    unset -f fullwidth_word
}

fullwidth $@
