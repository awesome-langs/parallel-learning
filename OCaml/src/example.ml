let hello () =
    print_endline "Hello World!"

let my_function (my_list : int list) : string =
    my_list |> List.filter (fun x -> x mod 2 = 0)
    |> List.map (fun x -> string_of_int (x * 3))
    |> List.fold_left (fun x y -> y ^ x ^ y) ""

let () = 
    hello ();
    print_endline (my_function [1;2;3;4;5])