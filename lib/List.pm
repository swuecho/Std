package List;
use Std;

#=
# pick a random element from list
#=
sub pick(@list) {
    return $list[ int rand @list ];
}

#==
# get frequecy hash from list
#==
sub frequency(@words) {
    my %words_dic;
    foreach (@words) {
        $words_dic{$_}++;
    }
    return %words_dic;
}

1;
