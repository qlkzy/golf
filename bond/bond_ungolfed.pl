    # output formatting
    $, = $\ = "\n";

    # read input into a hash of the form:
    #
    # 'Sean Connery' => 1
    # 'Roger Moore' => 2
    #
    # etc
    #
    # The hash automatically deduplicates actors; we sort in descending
    # rank order before assigning, so higher ranks will get overwritten
    # with lower.
    %o = map {reverse @$_}      # build list for hash constructor
         map {[m/(\d+) (.*)/]}  # parse line into ['number', 'name'] 
         sort                   # sort in descending rank order
                                # (relies on single digit)
         <>;                    # slurp whole input (list context)

    # output
    print
         sort {$o{$b} <=> $o{$a}}   # sort by hash value (rank)
         grep {/^(Barry Nelson|Bob Simmons|Sean Connery|Roger Moore|David Niven|George Lazenby|Timothy Dalton|Pierce Brosnan|Daniel Craig)$/} # filter to valid names
         keys %o;                   # all our actors are the keys of the hash
