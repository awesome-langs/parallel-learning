let myStringToInt = (s: string): int => {
    int_of_string(s);
}

let myStringToDouble = (s: string): float => {
    float_of_string(s);
}

let myIntToString = (i: int): string => {
    string_of_int(i);
}

let myDoubleToString = (d: float): string => {
    Printf.sprintf("%.6f", d);
}

let myBoolToString = (b: bool): string => {
    if (b) { "true" } else { "false" };
}

let myIntToNullable = (i: int): option(int) => {
    if (i > 0) { Some(i); } 
    else if (i < 0) { Some(-i); } 
    else { None; };
}

let myNullableToInt = (i: option(int)): int => {
    switch (i) {
    | Some(x) => x
    | None => -1
    };
}

let myListSorted = (lst: list(string)): list(string) => {
    List.sort(compare, lst);
}

let myListSortedByLength = (lst: list(string)): list(string) => {
    List.sort((x, y) => compare(String.length(x), String.length(y)), lst);
}

let myListFilter = (lst: list(int)): list(int) => {
    List.filter((x) => x mod 3 == 0, lst);
}

let myListMap = (lst: list(int)): list(int) => {
    List.map((x) => x * x, lst);
}

let myListReduce = (lst: list(int)): int => {
    List.fold_left((acc, x) => acc * 10 + x, 0, lst);
}

let myListOperations = (lst: list(int)): int => {
    lst
    |> List.filter((x) => x mod 3 == 0)
    |> List.map((x) => x * x)
    |> List.fold_left((acc, x) => acc * 10 + x, 0);
}

let myListToDict = (lst: list(int)): Hashtbl.t(int, int) => {
    Hashtbl.of_seq(List.to_seq(List.map((x) => (x, x * x), lst)));
}

let myDictToList = (dict: Hashtbl.t(int, int)): list(int) => {
    dict
    |> Hashtbl.to_seq
    |> List.of_seq
    |> List.sort(((k1, _), (k2, _)) => compare(k1, k2))
    |> List.map(((k, v)) => k + v);
}

let myPrintString = (s: string): unit => {
    print_endline(s);
}

let myPrintStringList = (lst: list(string)): unit => {
    List.iter((x) => print_string(x ++ " "), lst);
    print_endline("");
};

let myPrintIntList = (lst: list(int)): unit => {
    lst |> List.map(myIntToString) |> myPrintStringList;
}

let myPrintDict = (dict: Hashtbl.t(int, int)): unit => {
    Hashtbl.iter((k, v) => print_string(myIntToString(k) ++ "->" ++ myIntToString(v) ++ " "), dict);
    print_endline("");
}

myPrintString("Hello, World!");
myPrintString(myIntToString(myStringToInt("123")));
myPrintString(myDoubleToString(myStringToDouble("123.456")));
myPrintString(myBoolToString(false));
myPrintString(myIntToString(myNullableToInt(myIntToNullable(18))));
myPrintString(myIntToString(myNullableToInt(myIntToNullable(-15))));
myPrintString(myIntToString(myNullableToInt(myIntToNullable(0))));
myPrintStringList(myListSorted(["e", "dddd", "ccccc", "bb", "aaa"]));
myPrintStringList(myListSortedByLength(["e", "dddd", "ccccc", "bb", "aaa"]));
myPrintString(myIntToString(myListReduce(myListMap(myListFilter([3, 12, 5, 8, 9, 15, 7, 17, 21, 11])))));
myPrintString(myIntToString(myListOperations([3, 12, 5, 8, 9, 15, 7, 17, 21, 11])));
myPrintDict(myListToDict([3, 1, 4, 2, 5, 9, 8, 6, 7, 0]));
myPrintIntList(myDictToList(Hashtbl.of_seq(List.to_seq([(3, 9), (1, 1), (4, 16), (2, 4), (5, 25), (9, 81), (8, 64), (6, 36), (7, 49), (0, 0)]))));
