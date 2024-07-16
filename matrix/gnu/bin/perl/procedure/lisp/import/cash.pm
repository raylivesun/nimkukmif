#!/usr/bin/perl -w 

use strict;
use warnings;

use FindBin;
use File::Find;

my $dir = FindBin::RealDir;
my @files;

# Find all .txt files in the current directory and its subdirectories
find(sub { push @files, $File::Find::name if /\.txt$/i }, $dir);

# Sort the files alphabetically
@files = sort { $a cmp $b } @files;

# Print the sorted list of files
foreach my $file (@files) {
    print "$file\n";
}
