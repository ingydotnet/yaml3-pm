package YAML3::Parser;
use Pegex::Grammar -base;

sub grammar_text {
    return <<'...';
stream: <document>*

document: <directive>* <header> <node>

directive: /<PERCENT><WORD>+<SPACE>+(<ANY>+)<EOL>/

header: /<DASH><DASH><DASH>/

node: <seq> | <map> | <scalar>

seq: <empty_seq> | [ /<EOL>/ <item>+ ]

empty_seq: /<LSQUARE><RSQUARE><EOL>/

item: /<DASH><SPACE>+/ <value> /<EOL>/

map: <empty_map> | [ /<EOL>/ <pair>+ ]

empty_map: /<LCURLY><RCURLY><EOL>/

pair: <key> /<SPACE>*<COLON><SPACE>+/ <value> /<EOL>/

# value is kinda bogus, but the tests will guide us.

key: /(<ANY>+)(?=<SPACE>*<COLON>)/

value: /(<ANY>*)/

scalar: /<SPACE>+/ <value> /<EOL>/

...
}

1;
