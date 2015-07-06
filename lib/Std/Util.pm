package Std::Util;
use Std;
use HTTP::Tiny;
use Path::Tiny;
use Exporter::Auto;
use Data::Dumper;
use File::Temp qw/ tempfile /;
 
sub dd($ref) {
    my ($fh, $filename) = tempfile();
    $fh->print(Dumper($ref));
    say "dd result is in [$filename]";
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

__END__
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


# export
#use Exporter (qw/import/);
#our @EXPORT = qw/frequency get_content words/;
# TODO: investigate Exporter
# our @EXPORT_OK = qw/frequency get_content/;
## IO
