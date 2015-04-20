package List;
use Std;

#=
# pick a random element from list
#=
sub pick(@list) {
    #return $list[ int rand @list ];
    # the same, without int
    # $list[1] <=> $list[1.1]
    # todo: find documention abou this
    return $list[rand @list ];
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

sub contains {
    my $elem = shift;
    my %exists = map { $_ => 1} @_;
    return $exists{$elem};
}

1;
