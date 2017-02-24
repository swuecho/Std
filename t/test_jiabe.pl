use Jieba;
use utf8::all;
use v5.10;
say Jieba::test();
my $sentence = "他来到了网易杭研大厦";
use DDP;
p $sentence;
say $sentence;
p $_->[0] for Jieba::jieba_tokenize($sentence);
