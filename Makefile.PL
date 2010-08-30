use inc::Module::Install;

name            'YAML3';
all_from        'lib/YAML3.pm';

use_gloom       'YAML3::Base';
test_requires   'YAML::XS';

use_testml_tap;

WriteAll;
