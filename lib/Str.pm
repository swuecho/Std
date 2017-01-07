package Str;
use Std;

# copied from https://metacpan.org/source/perl5i::1::SCALAR
sub ltrim($string,$trim_charset = '\s') {
    my $re = qr/^[$trim_charset]*/;
    $string =~ s/$re//;
    return $string;
}

sub rtrim($string,$trim_charset = '\s') {
    my $re = qr/[$trim_charset]*$/;
    $string =~ s/$re//;
    return $string;
}

sub trim($string, $trim_charset = '\s') {
    return rtrim( ltrim( $string, $trim_charset ), $trim_charset );
}

#==
# split string to words
#==
sub words($content) {
    split( /\W+/, $content );
}

#==
# copied from  https://metacpan.org/source/XSAWYERX/App-UnANSI-0.003/lib/App/UnANSI.pm 
#==
sub remove_ansi_colors {
        $_[1] =~ s{\x1b\[[^m]*m}{}sgmx;
        return 1;
}


1;
