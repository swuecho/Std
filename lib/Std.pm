
package Std;
our $VERSION = '0.03';

# todo more stable version of this
# remove dependency to Syntax::Collector
use v5.20;
use Syntax::Collector -collect => q/
use strict           1.00         ;
use warnings         1.00         ;
use feature          1.00         ':5.20';
use experimental     0.007         'signatures'; 
use experimental     0.007         'postderef'; 
/;

1;
