#!/usr/bin/env raku

my $file-name = @*ARGS[0] // "data/helicases.txt";

my @experiments = $file-name.IO.slurp.split(/"Using Theano backend."\s+/);

say "Experiment, Validation, Test";

for @experiments[1..*-1].kv -> $i, $e {
    my @validation = $e ~~ m:g/ Validation  \s+ (\d+\.\d+) /;
    my @test = $e ~~ m:g/ Test  \s+ (\d+\.\d+) /;

    for 0..^@validation.elems -> $j {
        say "$i, {+@validation[$j][0]}, {+@test[$j][0]}";
    }
}

