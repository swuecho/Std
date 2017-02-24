package ChineseAnalyzer;
use Jieba;
use v5.10;
use Encode qw(decode_utf8);
use base qw( Lucy::Analysis::Analyzer );

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
    my @tokens = Jieba::jieba_tokenize(decode_utf8($text));
    $inversion->append(
       Lucy::Analysis::Token->new(text =>$_->[0],
                                  start_offset=> $_->[1] ,
                                  end_offset=>$_->[2] 
        )
        
    ) for @tokens;
    return $inversion;
}

1;
