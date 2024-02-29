using System;
using System.Collections.Generic;
using System.Linq;

class Example {
    public static int MyStringToInt(string s) {
        return int.Parse(s);
    }

    public static double MyStringToDouble(string s) {
        return double.Parse(s);
    }

    public static string MyIntToString(int i) {
        return i.ToString();
    }

    public static string MyDoubleToString(double d) {
        return string.Format("{0:N6}", d);
    }

    public static string MyBoolToString(bool b) {
        return b ? "true" : "false";
    }

    public static int? MyIntToNullable(int i) {
        if (i > 0) {
            return i;
        } else if (i < 0) {
            return -i;
        } else {
            return null;
        }
    }

    public static int MyNullableToInt(int? i) {
        return i ?? -1;
    }
    
    public static IList<string> MyListSorted(IList<string> lst) {
        return lst.OrderBy(x => x).ToList();
    }

    public static IList<string> MyListSortedByLength(IList<string> lst) {
        return lst.OrderBy(x => x.Length).ToList();
    }

    public static IList<int> MyListFilter(IList<int> lst) {
        return lst.Where(x => x % 3 == 0).ToList();
    }

    public static IList<int> MyListMap(IList<int> lst) {
        return lst.Select(x => x * x).ToList();
    }

    public static int MyListReduce(IList<int> lst) {
        return lst.Aggregate(0, (acc, x) => acc * 10 + x);
    }

    public static int MyListOperations(IList<int> lst) {
        return lst.Where(x => x % 3 == 0)
            .Select(x => x * x)
            .Aggregate(0, (acc, x) => acc * 10 + x);
    }

    public static IDictionary<int, int> MyListToDict(IList<int> lst) {
        return lst.ToDictionary(x => x, x => x * x);
    }

    public static IList<int> MyDictToList(IDictionary<int, int> lst) {
        return lst.OrderBy(x => x.Key).Select(x => x.Key + x.Value).ToList();
    }

    public static void MyPrintString(string s) {
        Console.WriteLine(s);
    }

    public static void MyPrintStringList(IList<string> lst) {
        foreach (var x in lst) {
            Console.Write(x + " ");
        }
        Console.WriteLine();
    }

    public static void MyPrintIntList(IList<int> lst) {
        MyPrintStringList(lst.Select(x => MyIntToString(x)).ToList());
    }

    public static void MyPrintDict(IDictionary<int, int> dict) {
        foreach (var (k, v) in dict) {
            Console.Write(MyIntToString(k) + "->" + MyIntToString(v) + " ");
        }
        Console.WriteLine();
    }

    public static void Main() {
        MyPrintString("Hello, World!");
        MyPrintString(MyIntToString(MyStringToInt("123")));
        MyPrintString(MyDoubleToString(MyStringToDouble("123.456")));
        MyPrintString(MyBoolToString(false));
        MyPrintString(MyIntToString(MyNullableToInt(MyIntToNullable(18))));
        MyPrintString(MyIntToString(MyNullableToInt(MyIntToNullable(-15))));
        MyPrintString(MyIntToString(MyNullableToInt(MyIntToNullable(0))));
        MyPrintStringList(MyListSorted(new List<string> {"e", "dddd", "ccccc", "bb", "aaa"}));
        MyPrintStringList(MyListSortedByLength(new List<string> {"e", "dddd", "ccccc", "bb", "aaa"}));
        MyPrintString(MyIntToString(MyListReduce(MyListMap(MyListFilter(new List<int> {3, 12, 5, 8, 9, 15, 7, 17, 21, 11})))));
        MyPrintString(MyIntToString(MyListOperations(new List<int> {3, 12, 5, 8, 9, 15, 7, 17, 21, 11})));
        MyPrintDict(MyListToDict(new List<int> {3, 1, 4, 2, 5, 9, 8, 6, 7, 0}));
        MyPrintIntList(MyDictToList(new Dictionary<int, int> {{3, 9}, {1, 1}, {4, 16}, {2, 4}, {5, 25}, {9, 81}, {8, 64}, {6, 36}, {7, 49}, {0, 0}}));
    }
}