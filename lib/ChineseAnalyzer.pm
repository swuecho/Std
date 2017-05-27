package ChineseAnalyzer;
use v5.10;
use Encode qw(decode_utf8);

use Lingua::ZH::Jieba;

use base qw( Lucy::Analysis::Analyzer );

my $jieba = Lingua::ZH::Jieba->new;

sub new {
    my $self = shift->SUPER::new;
    return $self;
}

sub equals {
    my ( $self, $other ) = @_;
    return $other->isa(__PACKAGE__);
}

sub transform {
    my ($self, $inversion)= @_;
    return $inversion;
}

sub transform_text {
    my ($self, $text) = @_;
    my $inversion = Lucy::Analysis::Inversion->new;
    my $tokens = $jieba->cut_for_search_ex(decode_utf8($text));
    $inversion->append(
       Lucy::Analysis::Token->new(text =>$_->[0],
                                  start_offset=> $_->[1] ,
                                  # end_offset + start_offset + size
                                  end_offset=> $_->[1] + $_->[2] 
        )
        
    ) for @$tokens;
    return $inversion;
}

1;
