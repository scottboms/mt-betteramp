#!/usr/bin/perl -w

# BetterAmp: a typographically better ampersand-encoding plugin for Movable Type
# by Scott Boms
# based on code originally by Nathaniel Irons
# http://www.scottboms.com
#
# Requires Movable Type 4.x or newer
#
# Version 1.0.1
# 2009/09/09

package MT::Plugin::BetterAmp;
use strict;
use warnings;

require MT;
use base qw( MT::Plugin );
use MT::Util qw( rtrim );

use MT::Template::Context;
use vars qw($VERSION);
our $VERSION = "1.0.1";

my $plugin = MT::Plugin::BetterAmp->new({
  id          => 'betteramp',
  name        => 'BetterAmp',
  description => 'Typographically enhanced ampersands.',
  author_name => 'Scott Boms (based on code originally by Nathaniel Irons)',
  author_link => 'http://www.scottboms.com',
  doc_link    => 'http://github.com/scottboms/mt-betteramp',
  icon        => 'ba-icon.gif',
  version     => $VERSION,
  registry => {
      tags => {
        modifier => {
          'better_amp' => \&better_amp,
      },
    },
  },
});

MT->add_plugin($plugin);

sub better_amp {
  my $html = shift; # text to be parsed
  $html =~ s/&(?!#?[xX]?(?:[0-9a-fA-F]+|\w{1,8});)/<span class='amp'>&amp;<\/span>/g;
  return $html;
}

1;
__END__

