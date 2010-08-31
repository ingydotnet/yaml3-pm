package YAML3::Parser;
use YAML3::Base -base;
use YAML3::Parser::Grammar;

has 'debug';

sub parse {
    my $self = shift;
    my $parser = YAML3::Parser::Grammar->new(
        receiver => YAML3::Parser::Receiver->new,
        debug => $self->debug,
    );
    $parser->parse(shift, 'stream')
        or die "Parse YAML3 failed";
    return $parser->receiver->node;
}

package YAML3::Parser::Receiver;
use YAML3::Base -base;

has 'node' => {};
has 'key';
has 'value';

sub try_map {
    my $self = shift;
    $self->node({});
}

sub try_seq {
    my $self = shift;
    $self->node([]);
}

sub got_key {
    my $self = shift;
    $self->key(shift);
}

sub got_value {
    my $self = shift;
    $self->value(shift);
}

sub got_pair {
    my $self = shift;
    $self->node->{$self->key} = $self->value;
}

sub got_item {
    my $self = shift;
    push @{$self->node}, shift;
}

1;
