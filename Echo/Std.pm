package Std;
our $VERSION = '0.03';
use v5.20;
use Syntax::Collector -collect => q/
use strict           1.00         ;
use warnings         1.00         ;
use feature          1.00         ':5.20';
use experimental     0.007         'signatures'; 
use experimental     0.007         'postderef'; 
/;

1;
