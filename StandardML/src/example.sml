fun myStringToInt (s: string): int = 
    Option.valOf (Int.fromString s)

fun myStringToDouble (s: string): real =
    Option.valOf (Real.fromString s)

fun myIntToString (i: int): string =
    Int.toString i

fun myDoubleToString (d: real): string =
    Real.fmt (StringCvt.FIX (SOME 6)) d

fun myBoolToString (b: bool): string =
    if b then "true" else "false"

fun myIntToNullable (i: int): int option =
    if i > 0 then SOME i
    else if i < 0 then SOME (~i)
    else NONE

fun myNullableToInt (i: int option): int =
    case i of
        SOME x => x
      | NONE => ~1

fun myListSorted (lst: string list): string list =
    ListMergeSort.sort (fn (a, b) => a < b) lst

fun myListSortedByLength (lst: string list): string list =
    ListMergeSort.sort (fn (a, b) => size a < size b) lst

fun myListFilter (lst: int list): int list =
    List.filter (fn x => x mod 3 = 0) lst

fun myListMap (lst: int list): int list =
    List.map (fn x => x * x) lst

fun myListReduce (lst: int list): int =
    List.foldl (fn (x, acc) => acc * 10 + x) 0 lst

fun myListOperations (lst: int list): int =
    List.foldl (fn (x, acc) => acc * 10 + x) 0
        (List.map (fn x => x * x) 
            (List.filter (fn x => x mod 3 = 0) lst))

fun myListToDict (lst: int list): (int * int) list =
    List.map (fn x => (x, x * x)) lst

fun myDictToList (dict: (int * int) list): int list =
    List.map (fn (k, v) => k + v)
        (ListMergeSort.sort (fn ((k1, _), (k2, _)) => k1 > k2) dict)

fun myPrintString (s: string): unit =
    print (s ^ "\n")

fun myPrintStringList (lst: string list): unit = (
    app (fn x => print (x ^ " ")) lst; 
    print "\n"
)

fun myPrintIntList (lst: int list): unit =
    myPrintStringList (List.map (fn x => myIntToString x) lst)

fun myPrintDict (dict: (int * int) list): unit = (
    app (fn (k, v) => print (myIntToString k ^ "->" ^ myIntToString v ^ " ")) dict; 
    print "\n"
)


;

myPrintString "Hello, World!";
myPrintString (myIntToString (myStringToInt "123"));
myPrintString (myDoubleToString (myStringToDouble "123.456"));
myPrintString (myBoolToString false);
myPrintString (myIntToString (myNullableToInt (myIntToNullable 18)));
myPrintString (myIntToString (myNullableToInt (myIntToNullable ~15)));
myPrintString (myIntToString (myNullableToInt (myIntToNullable 0)));
myPrintStringList (myListSorted ["e", "dddd", "ccccc", "bb", "aaa"]);
myPrintStringList (myListSortedByLength ["e", "dddd", "ccccc", "bb", "aaa"]);
myPrintString (myIntToString (myListReduce (myListMap (myListFilter [3, 12, 5, 8, 9, 15, 7, 17, 21, 11]))));
myPrintString (myIntToString (myListOperations [3, 12, 5, 8, 9, 15, 7, 17, 21, 11]));
myPrintDict (myListToDict [3, 1, 4, 2, 5, 9, 8, 6, 7, 0]);
myPrintIntList (myDictToList [(3, 9), (1, 1), (4, 16), (2, 4), (5, 25), (9, 81), (8, 64), (6, 36), (7, 49), (0, 0)]);
