# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Cryptsy-Socket.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use strict;
use warnings;

use Test::More tests => 1;
BEGIN { use_ok('Finance::Cryptsy:Socket') };

#########################

diag q{
You should just test from the command line with:

 $ perl -e 'use lib qw(lib); use base qw(Finance::Cryptsy::Socket); main->new(channels => [qw(trade.3 trade.53)])->go'

OR run the test example...

 $ cd ./ex; ./simple_example.pl

You should see text socket broadcasts from Cryptsy dump to the screen.

};

