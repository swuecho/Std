use Std;
# 1 + r + r^2
# future value
sub fv ($rate, $nper, $pmt) {
   ((1+$rate)**$nper -1)/$rate * $pmt
}

sub ear($rate, $nper) {
   (1+$rate/$nper)**$nper -1;
}

say fv(0.08,40,10000); # 2590565.18709999
say ear(0.10,12);
