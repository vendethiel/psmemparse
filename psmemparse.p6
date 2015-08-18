#!/usr/bin/env perl6 -n
multi sub trunc($name, $max where $name.elems < $max) { $name }
multi sub trunc($name, $max, $mid = $max / 2) {
  return substr($name, 0, $mid) ~ "..." ~ substr($name, -$mid);
}
state %process;

next if $*ARGFILES.line == 1;
my @F = .split: ' ';
%process{@F[10..*].join} += @F[3];

=begin x
END {
  for $name (sort {$process{$b} <=> $process{$a}} keys %process) {
    printf "%s takes in total %.2f%%\n", trunc($name, 50), $process{$name};
    last if ++$j == 5;
  }
}
=end x
