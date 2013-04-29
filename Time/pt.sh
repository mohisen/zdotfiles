#!usr/bash

PT=$HOME/zdotfiles/Time/april_prayertime

# display list of files in a directory sorted by amount of lines different with original.txt. {{{2
for f in $(ls -A ./dir); do echo -n $f && diff original.txt ./dir/$f | wc -l ; done | perl -ne 'my $h={}; while (<>) { chomp; if (/^(\S+?)\s*(\d+?)$/){$h->{$1}=$2;} }; for my $k (sort { $h->{$a} $h->{$b} } keys %$h ){ print "$k\t$h->{$k}\n"}'
