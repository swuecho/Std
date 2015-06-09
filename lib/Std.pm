package Std;
our $VERSION = '0.04';

# todo more stable version of this
# remove dependency to Syntax::Collector
use v5.20;
use strict;
use warnings;

use experimental qw();
use Import::Into; # TODO: copy the import::into

sub import {
    my $caller = caller;
    feature->import::into( $caller, ':5.20' );
    strict->import::into($caller);
    warnings->import::into($caller);
    # Try::Tiny->import::into($caller); TODO: learn about exception handling
    # List::MoreUtils->import::into( $caller, 'uniq' );
    experimental->import::into($caller, 'signatures', 'postderef');
}

1;
