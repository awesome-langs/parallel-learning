use List::Util qw(reduce);
use feature 'signatures';

sub hello {
    print "Hello World!\n";
}

sub my_function (@my_list) {
    return reduce { $b . $a . $b } '', 
        map { $_ * 3 } 
        grep { $_ % 2 == 0 } @my_list;
}

hello();
my $output = my_function((1, 2, 3, 4, 5));
print $output;