# char->number conversion table
# declared using barewords except for 's', which can't be a bareword
# because it's a keyword
%u=(o,.5, e,.1, i,.2, a,-.1, g,2, b,5, s=>.2);

# extract the number, first letter of first word, second letter of
# second word
/(\d+) (.).* .(.)/;

# do unit conversion and multiply up all factors
$x += $1 * $u{$2} * $u{$3}

# hack for -p to produce an END { ... print } block
}{

# format output
$_ = ($x>0?$x:0) . $" . ($x-0.5>0?$x-0.5:0)*10
