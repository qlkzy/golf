    print
         # reverse ranking order
         reverse
         # filter entries...
         grep {
             # only actual bonds
             /^(Barry Nelson|Bob Simmons|Sean Connery|Roger Moore|David Niven|George Lazenby|Timothy Dalton|Pierce Brosnan|Daniel Craig)$/
             # only new bonds
             && !$s{$_}++
         } map {s/\d+ //;$_}         # remove leading digit+space
         sort {($a=~/(\d+)/)[0] <=> ($b=~/(\d+)/)[0]}                       # sort lexically (works for single digits)
         <>;                        # slurp input as list (list context)
