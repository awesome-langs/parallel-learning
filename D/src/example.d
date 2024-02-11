import std.stdio;
import std.conv;
import std.algorithm : filter, map, fold;

void hello() {
    writeln("Hello World!");
}

string myFunction(int[] myList) {
    return myList.filter!(x => x % 2 == 0)
        .map!(x => to!string(x * 3))
        .fold!((x, y) => y ~ x ~ y)("");
}

void main() {
    hello();
    writeln(myFunction([1, 2, 3, 4, 5]));
}
