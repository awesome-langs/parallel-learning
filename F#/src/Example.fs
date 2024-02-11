open System.Collections.Generic

let hello () =
    printfn "Hello World!"

let myFunction (myList: list<int>): string =
    myList |> Seq.filter (fun x -> x % 2 = 0)
    |> Seq.map (fun x -> (x * 3).ToString())
    |> Seq.fold (fun x y -> y + x + y) ""

hello()
printfn "%s" ( myFunction [1; 2; 3; 4; 5] )