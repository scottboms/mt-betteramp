#!/usr/bin/perl -w

# BetterAmp: a typographically better ampersand-encoding plugin for Movable Type
# by Scott Boms
# based on code originally by Nathaniel Irons
# http://www.scottboms.com
#
# Requires Movable Type 4.x or newer
#
# Version 1.0
# 2009/08/02

package MT::Plugin::BetterAmp;
use strict;
use warnings;

use MT;
use MT::Template::Context;
use base qw( MT::Plugin );
use vars qw($VERSION);
our $VERSION = "1.0";

my $plugin = MT::Plugin::BetterAmp->new({
  id => 'betteramp',
  name => 'BetterAmp',
  description => 'Typographically enhanced ampersands.',
  author_name => 'Scott Boms (based on code originally by Nathaniel Irons)',
  author_link => 'http://www.scottboms.com',
  icon => 'ba-icon.gif',
  version => $VERSION,
});

MT->add_plugin($plugin);

eval {require MT::Template::Context};
unless ($@) {
  require MT::Template::Context;
  import MT::Template::Context;
  MT::Template::Context->add_global_filter( better_amp => \&better_amp );
}

sub better_amp {
    my $html = shift; # text to be parsed
    $html =~ s/&(?!#?[xX]?(?:[0-9a-fA-F]+|\w{1,8});)/<span class='amp'>&amp;<\/span>/g;	
    return $html;
}

1;
__END__

