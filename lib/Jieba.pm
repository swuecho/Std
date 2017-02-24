package Jieba;
use v5.10;
use parent 'Exporter';
our @EXPORT = qw/jieba_tokenize test/;

sub jieba_tokenize {
    jieba_tokenize_python(shift);
}

sub test {
    "hello world"
}
# TODO: 
#result = jieba.tokenize(u'永和服装饰品有限公司', mode='search')
use Inline Python => <<'END_OF_PYTHON_CODE';
from jieba import tokenize

def jieba_tokenize_python(text):
    seg_list = tokenize(text, mode='search')
    return(list(seg_list))

END_OF_PYTHON_CODE

1;
