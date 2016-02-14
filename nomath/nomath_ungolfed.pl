$\="\n";
while (<>) {
    ($n)=/(\d+)/;
    $n=$n*$n*$n if /e$/;
    $n=$n*$n if /r$/;
    /d$/ && $n=~s/\..*//;
    $n=(grep{$_*$_>=$n} 1..$n)[0] if /t$/;
    $n=$n>0?$n:-$n if /s$/;
    print $n;
}
