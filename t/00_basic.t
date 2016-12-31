use Std;
use Test::More tests => 2;

# 1 + r + r^2
# future value
sub fv ( $rate, $nper, $pmt ) {
    ( ( 1 + $rate )**$nper - 1 ) / $rate * $pmt;
}

sub ear ( $rate, $nper ) {
    ( 1 + $rate / $nper )**$nper - 1;
}

#  '==' is not right, 'eq' is ok
#  becuase number cmp is hard, when do str cmp, num coerce to str first
cmp_ok( fv( 0.08, 40, 10000 ), 'eq', 2590565.18709999 );
cmp_ok( ear( 0.10, 12 ), 'eq', 0.104713067441297 );
