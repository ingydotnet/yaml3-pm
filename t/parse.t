use TestML -run;
use YAML3::Parser;

sub parse_yaml {
    my $context = shift;
    my $yaml = $context->value;

#     XXX + YAML3::Parser->new->compile->grammar;
    YAML3::Parser->new(debug => 0)->parse($yaml);
}

__DATA__
%TestML 1.0
%PointMarker +++

Title = 'Basic Parser Testing';
Plan = 3;
Label = 'Parse test - $BlockLabel';

*yaml.parse_yaml.OK;

=== Simple mapping
+++ yaml
---
foo: bar

=== Seq
+++ yaml
---
- 1
- 2
- 3

=== Scalar
+++ yaml
--- O HAI
