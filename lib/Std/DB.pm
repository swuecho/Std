package Std::DB;
use Std;
use DBI;
use Exporter::Auto;

sub connect_sqlite {
    my $database = shift;
    my $driver   = "SQLite";
    my $dsn = "DBI:$driver:dbname=$database";
    my $dbh = DBI->connect($dsn,{ RaiseError => 1 })  or die $DBI::errstr;
    return $dbh
}

1;
