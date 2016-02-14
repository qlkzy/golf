# char->number conversion table
# declared using barewords except for 's', which can't be a bareword
# because it's a keyword
%u=(o,0.5, e,0.1, i,0.2, a,-0.1, g,2, b,5, s=>0.2);

# function to replace negative numbers or non-number with '0'
sub t {
    $_[0] > 0 ? $_[0] : 0
}

# extract the number, first letter of first word, second letter of
# second word
/(\d+) (.).* .(.)/;

# do unit conversion and multiply up all factors
$x += $1 * $u{$2} * $u{$3}

# hack for -p to produce an END { ... print } block
}{

# format output
$_ = t $x . ' ' . t ($x-0.5)*10
