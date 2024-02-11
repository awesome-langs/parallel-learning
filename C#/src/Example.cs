using System;
using System.Collections.Generic;
using System.Linq;

class Program {
    public static void Hello() {
        Console.WriteLine("Hello World!");
    }

    public static string MyFunction(IList<int> myList) {
        return myList.Where(x => x % 2 == 0)
                .Select(x => (x * 3).ToString())
                .Aggregate("", (x, y) => y + x + y);
    }

    public static void Main() {
        Hello();
        Console.WriteLine(MyFunction(new List<int> { 1, 2, 3, 4, 5 }));
    }
}
