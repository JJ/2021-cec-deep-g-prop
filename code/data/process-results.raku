#!/usr/bin/env raku

my $file-name = @*ARGS[0] // "data/helicases.txt";

my @experiments = $file-name.IO.slurp.split(/"Using Theano backend."\s+/);

say "Experiment, Validation, Test, Generations";

for @experiments[1..*-1].kv -> $i, $e {
    my @generations = $e ~~ m:g/ Generation \s+ (\d+) /;
    my @validation = $e ~~ m:g/ Validation  \s+ (\d+\.\d+) /;
    my @test = $e ~~ m:g/ Test  \s+ (\d+\.\d+) /;
    for 0..^@validation.elems -> $j {
        say "$i, {+@validation[$j][0]}, {+@test[$j][0]}, ", +@generations[*-1][0];
    }
}

