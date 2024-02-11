using Lambda;

class Example {
    public static function hello() {
        Sys.println("Hello World!");
    }

    public static function myFunction(myList:Array<Int>): String {
        return myList.filter(x -> x % 2 == 0)
            .map(x -> Std.string(x * 3))
            .fold((y, x) -> y + x + y, "");
    }

    public static function main() {
        hello();
        Sys.println(myFunction([1, 2, 3, 4, 5]));
    }
}
