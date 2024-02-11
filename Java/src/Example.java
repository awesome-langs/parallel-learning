import java.util.List;

public class Example {
    public static void hello() {
        System.out.println("Hello World!");
    }

    public static String myFunction(List<Integer> myList) {
        return myList.stream()
                .filter(x -> x % 2 == 0)
                .map(x -> String.valueOf(x * 3))
                .reduce("", (x, y) -> y + x + y);
    }

    public static void main(String[] args) {
        hello();
        System.out.println(myFunction(List.of(1, 2, 3, 4, 5)));
    }
}
