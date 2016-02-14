$\="\n";@i=split//,<>;pop@i;for$c('a'..(reverse sort@i)[0]){print map{/$c/?1:0}@i;}
