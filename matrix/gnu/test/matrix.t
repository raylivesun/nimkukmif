#!/usr/bin/perl 

use strict;
use warnings;

use FindBin;
use File::Find;

my $dir = FindBin::Realdir;

sub find_files {
    my ($dir, $ext) = @_;

    find(sub {
        my $file = $File::Find::name;
        if (-f $file && $file =~ /\.$ext$/) {
            print "$dir/$file\n";
        }
        }, $dir);
}

find_files($dir, 'txt');

1;