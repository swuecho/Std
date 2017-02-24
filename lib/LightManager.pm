package LightMergeManager;
use base qw( Lucy::Index::IndexManager );
 
sub recycle {
    my $self = shift;
    my $seg_readers = $self->SUPER::recycle(@_);
    @$seg_readers = grep { $_->doc_max < 1000 } @$seg_readers;
    return $seg_readers;
}
