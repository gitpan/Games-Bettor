use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Games::Bettor',
    AUTHOR              => 'Troy Denkinger <tdenkinger@gmail.com>',
    VERSION_FROM        => 'lib/Games/Bettor.pm',
    ABSTRACT_FROM       => 'lib/Games/Bettor.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Games-Bettor-*' },
);
