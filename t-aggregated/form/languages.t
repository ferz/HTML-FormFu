use strict;
use warnings;
use utf8;

use Test::More tests => 2;

use lib 't/lib';
use HTML::FormFu;

my $form = HTML::FormFu->new;

$form->load_config_file('t-aggregated/form/languages.yml');

# Invalid
{
    $form->process( {
            bar => 'foo',
        } );

    ok( !$form->submitted_and_valid );
    
    like( $form, qr/\QFeld muss ausgefüllt sein/ );
}

