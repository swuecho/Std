package Math;

require POSIX;

*ceil  = \&POSIX::ceil;
*floor = \&POSIX::floor;

sub round {
    abs( $_[0] - int( $_[0] ) ) < 0.5
      ? floor( $_[0] )
      : ceil( $_[0] );
}

require Scalar::Util;
*is_number = \&Scalar::Util::looks_like_number;

# is_number($_[0])
#  <=> $_[0]->is_number

sub is_positive { $_[0]->is_number && $_[0] > 0 }
sub is_negative { $_[0]->is_number && $_[0] < 0 }
sub is_integer  { $_[0]->is_number && ( ( int( $_[0] ) - $_[0] ) == 0 ) }
sub is_decimal  { $_[0]->is_number && ( ( int( $_[0] ) - $_[0] ) != 0 ) }

