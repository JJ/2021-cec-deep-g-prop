#!/usr/bin/env raku

my $file-name = @*ARGS[0] // "data/helicases.txt";

my @experiments = $file-name.IO.slurp.split(/"Data summary: Train" \s+ /);

say "Generation, Average-F2, Max-F2, Average-Acc, Min-Acc ";

for @experiments[1..*].kv -> $i, $e {
    my @generations = $e.split( /"-- Generation " \d+ " --" \s+ / );
    for @generations[1..*].kv -> $j, $g {
        my $max-f2 = $g ~~ /"Max" \s+ \d+\.\d+ \s+ \d+\.\d+  \s+ (\d+\.\d+ ) / ;
        my $min-accuracy = $g ~~ /"Min" \s+ (\d+\.\d+ )/;
        my $avg = $g ~~ /"Avg" \s+ (\d+\.\d+ ) \s+ \d+\.\d+  \s+ (\d+\.\d+ ) / ;
        say "$j, {$avg[1]}, {$max-f2[0]}, {$avg[0]}, {$min-accuracy[0]}";
    }
}

