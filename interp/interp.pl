@p=split/([<>!?^])/,<>;for$c(0..$#p){$_=$p[$c];/</&&push@j,$c;if(/>/){$a=pop@j;$p[$c]=">$a";$p[$a]="<$c";}}while($c<$#p){$_=$p[$c];/\^/&&$v{$l}++;/!/&&print$v{$l};/\?/&&($v{$l}=<>);/<(\d+)/&&($v{$l}?$v{$l}--:($c=$1));/>(\d+)/&&($c=$1-2);$l=$_;$c++;} 