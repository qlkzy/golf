    # append entire line to output record separator
    $\.=$_
}{
    # replace leading and trailng zeroes in output record separator
    $\ =~ s/^(0\n)*|(0\n)*\n$//gs
    # output record separator will be implicitly printed
