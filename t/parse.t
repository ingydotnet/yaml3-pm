use TestML -run;
use YAML3::Parser;

sub parse_yaml {
    my $context = shift;
    my $yaml = $context->value;
    YAML3::Parser->new->parse($yaml);
}

__DATA__
%TestML 1.0

Plan = 1;

*yaml.parse_yaml.OK;

=== Simple mapping
--- yaml
foo: bar
