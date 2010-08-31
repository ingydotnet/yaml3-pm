use TestML -run;
use YAML3::Parser;
use JSON::XS;

sub parse_yaml {
    my $context = shift;
    my $yaml = $context->value;

#     XXX + YAML3::Parser->new->compile->grammar;
    YAML3::Parser->new(debug => 0)->parse($yaml);
}

sub as_json {
    my $context = shift;
    my $thing = $context->value;
    JSON::XS->new->encode($thing);
}

__DATA__
%TestML 1.0
%PointMarker +++

Title = 'Basic Parser Testing';
Plan = 5;

Label = 'Parse OK - $BlockLabel';
*yaml.parse_yaml.OK;

Label = 'YAML matches JSON - $BlockLabel';
*yaml.parse_yaml.as_json == *json;

=== Simple mapping
+++ yaml
---
foo: bar
+++ json: {"foo":"bar"}

=== Simple sequence
+++ yaml
---
- 1
- 2
- 3
+++ json: ["1","2","3"]

=== Simple scalar
+++ yaml
--- O HAI
