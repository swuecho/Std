package Jieba;
use v5.10;
use Lingua::ZH::Jieba;
use parent 'Exporter';
our @EXPORT = qw/jieba_tokenize test/;

my $jieba = Lingua::ZH::Jieba->new();

sub jieba_tokenize {
    my $words_cut4search = $jieba->cut_for_search_ex(shift);
    return $words_cut4search;
}

sub test {
    "hello world perl"
}

1;
