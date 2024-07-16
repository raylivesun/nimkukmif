#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use File::Basename;
use File::Find;

my $dir = $File::Find::dir;
my $count = 0;

find(sub {
    my $file = $File::Find::name;
    my $ext = lc(fileparse($file, $File::Find::BIN));

    if (-f $file && $ext eq 'pl' && length($file) > 3) {
        my $base = basename($file, $ext);
        my $count_file = "$dir/$base.count";

        if (-f $count_file) {
            my $count_contents = < $count_file>;
            $count += $count_contents;
            print "$file: $count_contents\n";
            system("rm $count_file");
            system("touch $count_file");
            open(my $fh, ">", $count_file) or die "Can't open $
             count_file: $!";
            print $fh "$count\n";
            close($fh);
            system("chmod 644 $count_file");
            system("chown $USER $count_file");
            system("chgrp $GROUP $count_file");
            system("find $dir -type f -name '$base.*' -exec mv {} $dir
            \\;\\n";
        }
        else {
            print "$file: 0\n";
            system("touch $count_file");
            open(my $fh, ">", $count_file) or die "Can't open $
             count_file: $!";
            print $fh "0\n";
            close($fh);
            system("chmod 644 $count_file");
            system("chown $USER $count_file");
            system("chgrp $GROUP $count_file");
        }
        $count_files++;
    }
    elsif (-d $file) {
        print "Directory: $file\n";
    }
    else {
        print "Skipping: $file\n";
    }
    return;
    }, $dir);

print "Total Perl files found: $count_files\n";
