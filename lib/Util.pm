package Echo::Util;
use experimental 'signatures';
use HTTP::Tiny;
use Path::Tiny;
use Exporter::Auto;

sub is_upper { shift =~ /[A-Z]/ }

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
# split string to words
#==
sub words($content) {
    split( /\W+/, $content );
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
