package Echo::Util;
use experimental 'signatures';
use HTTP::Tiny;
use Path::Tiny;
use Exporter::Auto;

sub get_text($path) {
    path($path)->slurp;
}

sub get_url($url) {
    my $response = HTTP::Tiny->new->get($url);
    die "failed\n" unless $response->{success};
    return $response->{content};
}

sub get_content($str) {
    if ( $str =~ m/^http/ ) {
        get_url($str);
    }
    else {
        get_text($str);
    }
}



#==
## sort key by value in hash
#==
sub hash_sort (%dic) {
    my @sorted;
    foreach ( sort { $dic{$b} <=> $dic{$a} } ( keys %dic ) ) {
        push @sorted, [ $_, $dic{$_} ];
    }
    return @sorted;
}

1;

# export
#use Exporter (qw/import/);
#our @EXPORT = qw/frequency get_content words/;
# TODO: investigate Exporter
# our @EXPORT_OK = qw/frequency get_content/;
## IO
