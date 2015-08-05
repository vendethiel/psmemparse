#!/usr/bin/env perl -na
sub trunc {
  ($name, $max) = @_;
  $mid = $max / 2;
  if (length($name) < $max) {
    return $name;
  }
  return substr($name, 0, $mid) . "..." . substr($name, length($name) - $mid, $mid);
}

next if $. == 1;

@name = ();
for ($i = 10; $i < @F; $i++) {
  push @name, $F[$i];
}
$process{join '', @name} += $F[3];

END {
  for $name (sort {$process{$b} <=> $process{$a}} keys %process) {
    printf "%s takes in total %.2f%%\n", trunc($name, 50), $process{$name};
    last if ++$j == 5;
  }
}

