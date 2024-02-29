myStringToInt = (s) -> 
    parseInt(s)

myStringToDouble = (s) -> 
    parseFloat(s)

myIntToString = (i) -> 
    i.toString()

myDoubleToString = (d) -> 
    d.toFixed(6)

myBoolToString = (b) -> 
    if b then "true" 
    else "false"

myIntToNullable = (i) -> 
    if i > 0 then i
    else if i < 0 then -i
    else null

myNullableToInt = (i) -> 
    i ? -1

myListSorted = (lst) -> 
    [lst...].sort()

myListSortedByLength = (lst) -> 
    [lst...].sort (a, b) -> a.length - b.length

myListFilter = (lst) -> 
    lst.filter (x) -> x % 3 is 0

myListMap = (lst) -> 
    lst.map (x) -> x * x

myListReduce = (lst) -> 
    lst.reduce (acc, x) ->
        acc * 10 + x
    , ""

myListOperations = (lst) ->
    lst.filter (x) -> x % 3 is 0
        .map (x) -> x * x
        .reduce (acc, x) ->
            acc * 10 + x
        , ""

myListToDict = (lst) ->
    new Map lst.map (x) -> [x, x * x]

myDictToList = (dict) ->
    Array.from(dict)
        .sort (a, b) -> a[0] - b[0]
        .map (x) -> x[0] + x[1]

myPrintString = (s) ->
    console.log s

myPrintStringList = (lst) ->
    for x from lst
        process.stdout.write x + " "
    console.log ""

myPrintIntList = (lst) ->
    myPrintStringList lst.map (x) -> myIntToString x

myPrintDict = (dict) ->
    for [k, v] from dict
        process.stdout.write myIntToString k + "->" + myIntToString v + " "
    console.log ""

myPrintString "Hello, World!"
myPrintString myIntToString myStringToInt "123"
myPrintString myDoubleToString myStringToDouble "123.456"
myPrintString myBoolToString false
myPrintString myIntToString myNullableToInt myIntToNullable 18
myPrintString myIntToString myNullableToInt myIntToNullable -15
myPrintString myIntToString myNullableToInt myIntToNullable 0
myPrintStringList myListSorted ["e", "dddd", "ccccc", "bb", "aaa"]
myPrintStringList myListSortedByLength ["e", "dddd", "ccccc", "bb", "aaa"]
myPrintString myIntToString myListReduce myListMap myListFilter [3, 12, 5, 8, 9, 15, 7, 17, 21, 11]
myPrintString myIntToString myListOperations [3, 12, 5, 8, 9, 15, 7, 17, 21, 11]
myPrintDict myListToDict [3, 1, 4, 2, 5, 9, 8, 6, 7, 0]
myPrintIntList myDictToList new Map [[3, 9], [1, 1], [4, 16], [2, 4], [5, 25], [9, 81], [8, 64], [6, 36], [7, 49], [0, 0]]