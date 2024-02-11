module Example exposing (..)

import Posix.IO as IO exposing (..)
import Posix.IO.Process as Process

hello : IO ()
hello =
    Process.print "Hello World!"

myFunction : List Int -> String
myFunction myList =
    myList |> List.filter (\x -> modBy 2 x == 0)
        |> List.map (\x -> String.fromInt (x * 3))
        |> List.foldl (\y x -> y ++ x ++ y) ""

program : Process -> IO ()
program process =
    do hello <| \_ ->
    Process.print ( myFunction [1, 2, 3, 4, 5] )
