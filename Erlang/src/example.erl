-module(example).
-export([main/0]).

hello() ->
    io:format("Hello World!~n").

my_function(MyList) ->
    lists:foldl(fun(Y, X) -> Y ++ X ++ Y end, "", 
        lists:map(fun(X) -> integer_to_list(X * 3) end, 
            lists:filter(fun(X) -> X rem 2 =:= 0 end, MyList))).

main() ->
    hello(),
    io:format(my_function([1, 2, 3, 4, 5])).