sub hello {
    say "Hello World!";
}

sub my-function(@my-list) returns Str {
    return ("", |(@my-list
        .grep({$_ % 2 == 0})
        .map({($_ * 3).Str})
    )).reduce({$^b~$^a~$^b})

}

hello;
say my-function((1, 2, 3, 4, 5));