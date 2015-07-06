package Hash; 
use Std;

=head1 
    
    Utility function for Hash

=over 4

=item sort

      sort key by value in hash

=back

=cut 

sub hash_sort (%dic) {
    my @sorted;
    foreach ( sort { $dic{$b} <=> $dic{$a} } ( keys %dic ) ) {
        push @sorted, [ $_, $dic{$_} ];
    }
    return @sorted;
}


1;

