# implicit while loop added by -p
while (<>) {
    # append line to output record separator
    $\.=$_
}{ # escape the implicit while loop
    # replace leading and traling 
    $\=~s/^(0\n)*|(0\n)*\n$//gs
    # print by default prints $_ followed by
    # the output record separator $\ which contains our answer
    ;print # implicit print added by -p
} # implicit closing brace added by -p
