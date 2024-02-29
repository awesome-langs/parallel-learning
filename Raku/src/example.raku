sub my-string-to-int ($s) {
    return $s.Int;
}

sub my-string-to-double ($s) {
    return $s.Num;
}

sub my-int-to-string ($i) {
    return $i.Str;
}

sub my-double-to-string ($d) {
    return sprintf("%.6f", $d);
}

sub my-bool-to-string ($b) {
    return $b ?? "true" !! "false";
}

sub my-int-to-nullable ($i) {
    if $i > 0 {
        return $i;
    } elsif $i < 0 {
        return -$i;
    } else {
        return Nil;
    }
}

sub my-nullable-to-int ($i) {
    return $i // -1;
}

sub my-list-sorted (@lst) {
    return @lst.sort;
}

sub my-list-sorted-by-length (@lst) {
    return @lst.sort({$^a.chars <=> $^b.chars});
}

sub my-list-filter (@lst) {
    return @lst.grep({$_ %% 3});
}

sub my-list-map (@lst) {
    return @lst.map({$_ * $_});
}

sub my-list-reduce (@lst) {
    return (0, |@lst).reduce({$^a * 10 + $^b});
}

sub my-list-operations (@lst) {
    return (0, |(@lst.grep(-> $x { $x %% 3 })
        .map(-> $x { $x * $x })))
        .reduce({$^a * 10 + $^b});
}

sub my-list-to-dict (@lst) {
    return @lst.map({$_ => $_ * $_}).Hash;
}

sub my-dict-to-list (%dict) {
    return %dict.keys.sort.map({$_ + %dict{$_}});
}

sub my-print-string ($s) {
    say $s;
}

sub my-print-string-list (@lst) {
    for @lst -> $x {
        print $x ~ " ";
    }
    say "";
}

sub my-print-int-list (@lst) {
    my-print-string-list(@lst.map({my-int-to-string($_)}));
}

sub my-print-dict (%dict) {
    for %dict.kv -> $k, $v {
        print my-int-to-string($k) ~ "->" ~ my-int-to-string($v) ~ " ";
    }
    say "";
}

my-print-string("Hello, World!");
my-print-string(my-int-to-string(my-string-to-int("123")));
my-print-string(my-double-to-string(my-string-to-double("123.456")));
my-print-string(my-bool-to-string(False));
my-print-string(my-int-to-string(my-nullable-to-int(my-int-to-nullable(18))));
my-print-string(my-int-to-string(my-nullable-to-int(my-int-to-nullable(-15))));
my-print-string(my-int-to-string(my-nullable-to-int(my-int-to-nullable(0))));
my-print-string-list(my-list-sorted(("e", "dddd", "ccccc", "bb", "aaa")));
my-print-string-list(my-list-sorted-by-length(("e", "dddd", "ccccc", "bb", "aaa")));
my-print-string(my-int-to-string(my-list-reduce(my-list-map(my-list-filter((3, 12, 5, 8, 9, 15, 7, 17, 21, 11))))));
my-print-string(my-int-to-string(my-list-operations((3, 12, 5, 8, 9, 15, 7, 17, 21, 11))));
my-print-dict(my-list-to-dict((3, 1, 4, 2, 5, 9, 8, 6, 7, 0)));
my-print-int-list(my-dict-to-list({3 => 9, 1 => 1, 4 => 16, 2 => 4, 5 => 25, 9 => 81, 8 => 64, 6 => 36, 7 => 49, 0 => 0}));
