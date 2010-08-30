package YAML3::Parser;
use Pegex::Grammar -base;

sub grammar_text {
    return <<'...';
stream: /foo<COLON><SPACE>bar<EOL>/
...
}

1;
