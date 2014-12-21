#!/usr/bin/perl -wT

use 5.010;
use strict;
use warnings;
use lib qw(../lib);
use base qw(Finance::Cryptsy::Socket);

use Finance::Cryptsy::Socket;
use Data::Dumper;

# Turn on DEBUG to get see the JSON responses as a hash...
use constant DEBUG   => 0;
use constant VERBOSE => 0;

# this will connect to the socket and then start calling the methods below as socket messages arrive...
main->new->go;

# note that a lot of method names are inherited from Cryptsy::AnyEvent, so if you want to do more then what
# can be done in a method call, create a new Handler object, send the data there and then have the handler processes
# the responses.

# some additional/optional methods...

# uncomment this to limit trade/ticker channels...
#sub channels { 
# [qw(trade.X ticker.X)]
#}

# if you have some special app key for the pusher site, enter it here...
#sub app_key { 'app key goes in here' }

# You want to use these.
# Write these to match what you want to do with the data... like store it into a database.
sub trade {
    my $self = shift;
    my $data = shift;
    print Data::Dumper->Dump([$data],['Trade']) if DEBUG;
    printf "[%s : Trade  ID %s] %s %s @ %s %s for %s\n", map($data->{$_}, qw(datetime tradeid type quantity price marketname total));
}


sub ticker {
    my $self = shift;
    my $data = shift;
    print Data::Dumper->Dump([$data],['Ticker']) if DEBUG;
    printf "[%s - Market ID %s] Buy %s @ %s, Sell %s @ %s at %s\n", $data->{datetime}, $data->{marketid}, map($data->{topbuy}->{$_}, qw(quantity price)), map($data->{topsell}->{$_}, qw(quantity price)), $data->{timestamp};
}

1;

__END__

