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

sub trim($string,$trim_charset = '\s') {
    return rtrim( ltrim( $string, $trim_charset ), $trim_charset );
}

1;
