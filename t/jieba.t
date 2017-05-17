use Test::More tests => 23;
use Test::Deep;
use Jieba;

use utf8::all;

use v5.10;
is(Jieba::test(), "hello world", "can call test func");
my $sentence = "他来到了网易杭研大厦";
my $tokens = Jieba::jieba_tokenize($sentence);
#use Data::Dumper;
#print Dumper($tokens);
my $expected_token=
 [
          [
            "\x{4ed6}",
            0,
            1
          ],
          [
            "\x{6765}\x{5230}",
            1,
            3
          ],
          [
            "\x{4e86}",
            3,
            4
          ],
          [
            "\x{7f51}\x{6613}",
            4,
            6
          ],
          [
            "\x{676d}\x{7814}",
            6,
            8
          ],
          [
            "\x{5927}\x{53a6}",
            8,
            10
          ]
        ];

cmp_deeply(
  $tokens,
  $expected_token,
  "tokes is correct"
);
