use ChineseAnalyzer;
use utf8::all;
use v5.10;
my $sentence = "他来到了我家";
say $sentence;

my $chinese = ChineseAnalyzer->new();
my $in      = $chinese->transform_text($sentence);
while ( my $x = $in->next ) {
    say $x->get_text;
    say $x->get_start_offset;
    say $x->get_end_offset;
}
