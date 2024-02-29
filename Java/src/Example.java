import java.util.*;
import java.util.stream.*;

public class Example {
    public static int myStringToInt(String s) {
        return Integer.parseInt(s);
    }

    public static double myStringToDouble(String s) {
        return Double.parseDouble(s);
    }

    public static String myIntToString(int i) {
        return Integer.toString(i);
    }

    public static String myDoubleToString(double d) {
        return String.format("%.6f", d);
    }

    public static String myBoolToString(boolean b) {
        return b ? "true" : "false";
    }

    public static Integer myIntToNullable(int i) {
        if (i > 0) {
            return i;
        } else if (i < 0) {
            return -i;
        } else {
            return null;
        }
    }

    public static int myNullableToInt(Integer i) {
        return i != null ? i : -1;
    }

    public static List<String> myListSorted(List<String> lst) {
        return lst.stream().sorted().collect(Collectors.toList());
    }

    public static List<String> myListSortedByLength(List<String> lst) {
        return lst.stream().sorted(Comparator.comparingInt(String::length)).collect(Collectors.toList());
    }

    public static List<Integer> myListFilter(List<Integer> lst) {
        return lst.stream().filter(x -> x % 3 == 0).collect(Collectors.toList());
    }

    public static List<Integer> myListMap(List<Integer> lst) {
        return lst.stream().map(x -> x * x).collect(Collectors.toList());
    }

    public static int myListReduce(List<Integer> lst) {
        return lst.stream().reduce(0, (acc, x) -> acc * 10 + x);
    }

    public static int myListOperations(List<Integer> lst) {
        return lst.stream().filter(x -> x % 3 == 0)
            .map(x -> x * x)
            .reduce(0, (acc, x) -> acc * 10 + x);
    }

    public static Map<Integer, Integer> myListToDict(List<Integer> lst) {
        return lst.stream().collect(Collectors.toMap(x -> x, x -> x * x));
    }

    public static List<Integer> myDictToList(Map<Integer, Integer> lst) {
        return lst.entrySet().stream().sorted(Map.Entry.comparingByKey())
            .map(x -> x.getKey() + x.getValue()).collect(Collectors.toList());
    }

    public static void myPrintString(String s) {
        System.out.println(s);
    }

    public static void myPrintStringList(List<String> lst) {
        for (var x : lst) {
            System.out.print(x + " ");
        }
        System.out.println();
    }

    public static void myPrintIntList(List<Integer> lst) {
        myPrintStringList(lst.stream().map(x -> myIntToString(x)).collect(Collectors.toList()));
    }

    public static void myPrintDict(Map<Integer, Integer> dict) {
        for (var x : dict.entrySet()) {
            System.out.print(myIntToString(x.getKey()) + "->" + myIntToString(x.getValue()) + " ");
        }
        System.out.println();
    }

    public static void main(String[] args) {
        myPrintString("Hello, World!");
        myPrintString(myIntToString(myStringToInt("123")));
        myPrintString(myDoubleToString(myStringToDouble("123.456")));
        myPrintString(myBoolToString(false));
        myPrintString(myIntToString(myNullableToInt(myIntToNullable(18))));
        myPrintString(myIntToString(myNullableToInt(myIntToNullable(-15))));
        myPrintString(myIntToString(myNullableToInt(myIntToNullable(0))));
        myPrintStringList(myListSorted(List.of("e", "dddd", "ccccc", "bb", "aaa")));
        myPrintStringList(myListSortedByLength(List.of("e", "dddd", "ccccc", "bb", "aaa")));
        myPrintString(myIntToString(myListReduce(myListMap(myListFilter(List.of(3, 12, 5, 8, 9, 15, 7, 17, 21, 11))))));
        myPrintString(myIntToString(myListOperations(List.of(3, 12, 5, 8, 9, 15, 7, 17, 21, 11))));
        myPrintDict(myListToDict(List.of(3, 1, 4, 2, 5, 9, 8, 6, 7, 0)));
        myPrintIntList(myDictToList(Map.ofEntries(Map.entry(3, 9), Map.entry(1, 1), Map.entry(4, 16), Map.entry(2, 4), Map.entry(5, 25), Map.entry(9, 81), Map.entry(8, 64), Map.entry(6, 36), Map.entry(7, 49), Map.entry(0, 0))));
    }
}