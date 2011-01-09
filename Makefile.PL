
use strict;
use warnings;

BEGIN { require 5.006; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Perl module to find differences between files',
  'AUTHOR' => 'Jonathan Yu <jawnsy@cpan.org>',
  'BUILD_REQUIRES' => {
    'Test::NoWarnings' => '0.084'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'Algorithm-Diff-Any',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'Algorithm::Diff::Any',
  'PREREQ_PM' => {
    'Algorithm::Diff' => '1.1902',
    'Exporter' => '5.57',
    'Test::More' => '0.62'
  },
  'VERSION' => '1.001',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



