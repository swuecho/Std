package CouchDB;
use Moo;
use LWP::UserAgent;

has 'host' => ( is => 'ro' );
has 'port' => ( is => 'ro' );

has 'base' => (
    is      => 'ro',
    lazy    => 1,
    builder => sub {
        my $self = shift;
        my ( $host, $port ) = ( $self->host, $self->port );
        return "http://$host:$port/",;
    }
);

has 'ua' => ( is => 'ro', builder => 1 );

sub _build_ua {
    my $ua = LWP::UserAgent->new;
    $ua->timeout(10);
    $ua->env_proxy;
    return $ua;
}

sub request {
    my ( $self, $method, $uri, $content ) = @_;

    my $full_uri = $self->base . $uri;
    my $req;

    if ( defined $content ) {

        #Content-Type: application/json
        $req = HTTP::Request->new( $method, $full_uri, undef, $content );
        $req->header( 'Content-Type' => 'application/json' );
    }
    else {
        $req = HTTP::Request->new( $method, $full_uri );
    }

    my $response = $self->ua->request($req);

    if ( $response->is_success ) {
        return $response->content;
    }
    else {
        die( $response->status_line . ":" . $response->content );
    }
}

sub delete {
    my ( $self, $url ) = @_;

    $self->request( DELETE => $url );
}

sub get {
    my ( $self, $url ) = @_;

    $self->request( GET => $url );
}

sub put {
    my ( $self, $url, $json ) = @_;

    $self->request( PUT => $url, $json );
}

sub post {
    my ( $self, $url, $json ) = @_;

    $self->request( POST => $url, $json );
}

1;
