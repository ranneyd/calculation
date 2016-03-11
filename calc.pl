use 5.22.1;
use strict;
use Data::Dumper;

my @deck = ();

my @ranks = qw{A 2 3 4 5 6 7 8 9 10 J Q K};

for(my $rank = 0; $rank < scalar @ranks; ++$rank) {
    # we take one A 2 3 and 4 out
    for(my $i = 0; $i < ($rank <= 3 ? 3 : 4); ++$i){
        push @deck, $ranks[$rank];
    }
}

my $deckLength = scalar @deck;
for(my $i = 0; $i < $deckLength; ++$i) {
    my $rand = int(rand($deckLength));

    ($deck[$i], $deck[$rand]) = ($deck[$rand], $deck[$i]);
}

my $notOver = 1;

my @patterns = (
    [qw{A   2   3   4   5   6   7   8   9   10  J   Q   K}],
    [qw{2   4   6   8   10  Q   A   3   5   7   9   J   K}],
    [qw{3   6   9   Q   2   5   8   J   A   4   7   10  K}],
    [qw{4   8   Q   3   7   J   2   6   10  A   5   9   K}]
);


my @foundations = qw{A 2 3 4};

my @waste = ((),(),(),());

my %deckRef = {
    "A": 3,
    "2": 3,
    "3": 3,
    "4": 4,
    "5": 4,
    "6": 4,
    "7": 4,
    "8": 4,
    "9": 4,
    "10": 4,
    "J": 4,
    "Q": 4,
    "K": 4    
}

while($notOver) {
    for(my $i = 0; $i < 4; ++$i) {
        print join(" ", @{@patterns[$i]})."\n";
    }
    print "\n";
    my $buff = <>;
    chomp $buff;

    if($buff eq "quit") {
        $notOver = 0;
    }
}

print join " ", @deck;

print "\n";

