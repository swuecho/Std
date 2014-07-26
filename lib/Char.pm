package Std::Char;
use v5.20;
use experimental 'signatures';
use Exporter::Auto;

sub is_upper { shift =~ /[A-Z]/ }

sub is_lower { shift =~ /[a-z]/ }

