hello = ->
    console.log "Hello World!"

myFunction = (myList) ->
    myList.filter (x) -> x % 2 == 0
        .map (x) -> (x * 3).toString()
        .reduce (x, y) -> 
            y + x + y
        , ""

hello()
console.log myFunction([1, 2, 3, 4, 5])