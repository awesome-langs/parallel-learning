module Main
import Data.String
import Data.SortedMap

myStringToInt : String -> Int
myStringToInt s = 
    case String.parseInteger s of
        Just i => i
        Nothing => -1

myStringToDouble : String -> Double
myStringToDouble s = 
    case String.parseDouble s of
        Just d => d
        Nothing => -1.0

myIntToString : Int -> String
myIntToString i = 
    show i

myDoubleToString : Double -> String
myDoubleToString d = 
    show d

myBoolToString : Bool -> String
myBoolToString b = 
    if b then "true" else "false"

myIntToNullable : Int -> Maybe Int
myIntToNullable i = 
    if i > 0 then Just i
    else if i < 0 then Just (-i)
    else Nothing

myNullableToInt : Maybe Int -> Int
myNullableToInt i = 
    case i of
        Just x => x
        Nothing => -1

myListSorted : List String -> List String
myListSorted lst = 
    sort lst

myListSortedByLength : List String -> List String
myListSortedByLength lst = 
    sortBy (\a, b => length a `compare` length b) lst

myListFilter : List Int -> List Int
myListFilter lst = 
    filter (\x => x `mod` 3 == 0) lst

myListMap : List Int -> List Int
myListMap lst = 
    map (\x => x * x) lst

myListReduce : List Int -> Int
myListReduce lst = 
    foldl (\acc, x => acc * 10 + x) 0 lst

myListOperations : List Int -> Int
myListOperations lst = 
    foldl (\acc, x => acc * 10 + x) 0 
        (map (\x => x * x)
            (filter (\x => x `mod` 3 == 0) lst))

myListToDict : List Int -> SortedMap Int Int
myListToDict lst = 
    SortedMap.fromList (map (\x => (x, x * x)) lst)

myDictToList : SortedMap Int Int -> List Int
myDictToList dict = 
    map (\(k, v) => k + v) (SortedMap.toList dict)

myPrintString : String -> IO ()
myPrintString s = 
    putStrLn s

myPrintStringList : List String -> IO ()
myPrintStringList lst = 
    foldr (\x, acc => putStr (x ++ " ") >> acc ) 
        (putStrLn "") lst

myPrintIntList : List Int -> IO ()
myPrintIntList lst = 
    myPrintStringList (map (\x => myIntToString x) lst)

myPrintDict : SortedMap Int Int -> IO ()
myPrintDict dict = 
    foldr (\(k, v), acc => putStr (myIntToString k ++ "->" ++ myIntToString v ++ " ") >> acc) 
        (putStrLn "") (SortedMap.toList dict)

main : IO ()
main = 
    do
    myPrintString "Hello, World!"
    myPrintString (myIntToString (myStringToInt "123"))
    myPrintString (myDoubleToString (myStringToDouble "123.456"))
    myPrintString (myBoolToString False)
    myPrintString (myIntToString (myNullableToInt (myIntToNullable 18)))
    myPrintString (myIntToString (myNullableToInt (myIntToNullable (- 15))))
    myPrintString (myIntToString (myNullableToInt (myIntToNullable 0)))
    myPrintStringList (myListSorted ["e", "dddd", "ccccc", "bb", "aaa"])
    myPrintStringList (myListSortedByLength ["e", "dddd", "ccccc", "bb", "aaa"])
    myPrintString (myIntToString (myListReduce (myListMap (myListFilter [3, 12, 5, 8, 9, 15, 7, 17, 21, 11]))))
    myPrintString (myIntToString (myListOperations [3, 12, 5, 8, 9, 15, 7, 17, 21, 11]))
    myPrintDict (myListToDict [3, 1, 4, 2, 5, 9, 8, 6, 7, 0])
    myPrintIntList (myDictToList (SortedMap.fromList [(3, 9), (1, 1), (4, 16), (2, 4), (5, 25), (9, 81), (8, 64), (6, 36), (7, 49), (0, 0)]))
