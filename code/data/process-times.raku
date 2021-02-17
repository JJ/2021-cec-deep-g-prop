#!/usr/bin/env raku

my $file-name = @*ARGS[0] // "data/helicases.txt";

my @experiments = $file-name.IO.slurp.split(/"libcudart.so.11.0" \s+ /);

say "Time";

my $last-time;
for @experiments[1..*] -> $e {
    my $date-line = $e.lines.first: /^\d+\w+\d+_/;
    my $datetime = S/20Nov/2020-11-/ with $date-line.split(/"|"/)[0];
    $datetime ~~ s/21Feb/2021-02-/;
    my ($date,$time) = $datetime.split("_");
    my $this-time = DateTime.new( $date ~ "T" ~ $time.comb.rotor(2).map( *.join("") ).join(":") );
    if $last-time {
        say $this-time - $last-time if 1000 < $this-time - $last-time < 10000;
    }
    $last-time = $this-time;
}



