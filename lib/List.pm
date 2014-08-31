package List;
use Std;

sub pick(@list) {
    return $list[ int rand @list ];
}

1;
