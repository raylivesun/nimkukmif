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

sub print_coke_paste {
    my ($filename) = @_;

    open(my $fh, '<', $filename) or die "Couldn't open $filename: $!";

    my $coke_count = 0;
    my $paste_count = 0;
 

   while (my $line = <$fh>) {
    if ($line =~ /coke/i) {
        $coke_count++;
    } elsif ($line =~ /paste/i) {
        $paste_count++;
    }
}

    print "File: $filename\n";
    print "Coke count: $coke_count\n";
    print "Paste count: $paste_count\n";

    close($fh);
}

# Print the count of coke and paste occurrences for each .txt file
foreach my $file (@files) {
    print_coke_paste($file);
}

sub print_coke_paste_file {
    my ($filename) = @_;

    open(my $fh, '<', $filename) or die "Couldn't open $filename: $!";

    my $coke_count = 0;
    my $paste_count = 0;
    my $coke_line_count = 0;
    my $paste_line_count = 0;
    
    while (my $line = <$fh>) {
        if ($line =~ /coke/i) {
            $coke_count++;
            $coke_line_count++;
        } elsif ($line =~ /paste/i) {
            $paste_count++;
            $paste_line_count++;
        }
    }

    print "File: $filename\n";
    print "Coke count: $coke_count\n";
    print "Paste count: $paste_count\n";
    print "Coke line count: $coke_line_count\n";
    print "Paste line count: $paste_line_count\n";

    close($fh);
}

