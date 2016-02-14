# output formatting
$\="\n";
# get input chars as array
@i = split//, <>;
# lose the newline
pop @i;
# iterate over characters up to the max
for $c ('a'..(reverse sort@i)[0]) {
    # print 1 for each match, 0 otherwise
    print map { /$c/ ? 1 : 0 } @i;
}
