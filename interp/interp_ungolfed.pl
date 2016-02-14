# treat the first line of input as a program

# split on punctuation keywords; @p will contain the program as a list
# of tokens (including whitespace between adjacent punctuation)
@p = split /([<>!?^])/, <>;

# rewrite jump addresses

# the interpreter could scan backwards to avoid this, but that idea
# makes me feel dirty
for $c (0..$#p) {
    $_ = $p[$c];
    # save loop-start address on stack
    /</ && push @j, $c;
    if (/>/) {
        # if we encounter a loop-end instruction, rewrite it and the
        # corresponding loop-start to include the address (of the
        # instruction---jumps have to offset from this)
        $a = pop @j;
        $p[$c] = ">$a";
        $p[$a] = "<$c";
    }
}

# execute the program

# our program is already in @p

# $c will contain our program counter

# $l will contain the name of the last-referenced variable

while ($c < $#p) {
    # move current instruction into $_ for shorter matching
    $_ = $p[$c];

    # increment instruction
    /\^/ && $v{$l}++;

    # output instruction
    /!/ && print $v{$l};

    # input instruction
    /\?/ && ($v{$l} = <>);

    # loop start, including address
    /<(\d+)/ && ($v{$l} ? $v{$l}-- : ($c = $1));

    # loop end, including address
    />(\d+)/ && ($c = $1-2);

    # copy current instruction into "last variable name"---this will
    # sometimes contain operators, but we have null-string
    # instructions between adjacent operators, so it'll be fine
    $l = $_;

    # advance the program counter
    $c++;
}
