let myStringToInt (s : string) = (int_of_string s : int)
let myStringToDouble (s : string) = (float_of_string s : float)
let myIntToString (i : int) = (string_of_int i : string)
let myDoubleToString (d : float) = (Printf.sprintf "%.6f" d : string)
let myBoolToString (b : bool) = (if b then "true" else "false" : string)
let myIntToNullable (i : int) =
  (if i > 0
   then ((Some (i))[@explicit_arity ])
   else if i < 0 then ((Some ((- i)))[@explicit_arity ]) else None : 
  int option)
let myNullableToInt (i : int option) =
  (match i with | ((Some (x))[@explicit_arity ]) -> x | None -> (-1) : 
  int)
let myListSorted (lst : string list) = (List.sort compare lst : string list)
let myListSortedByLength (lst : string list) =
  (List.sort (fun x -> fun y -> compare (String.length x) (String.length y))
     lst : string list)
let myListFilter (lst : int list) =
  (List.filter (fun x -> (x mod 3) = 0) lst : int list)
let myListMap (lst : int list) = (List.map (fun x -> x * x) lst : int list)
let myListReduce (lst : int list) =
  (List.fold_left (fun acc -> fun x -> (acc * 10) + x) 0 lst : int)
let myListOperations (lst : int list) =
  (((lst |> (List.filter (fun x -> (x mod 3) = 0))) |>
      (List.map (fun x -> x * x)))
     |> (List.fold_left (fun acc -> fun x -> (acc * 10) + x) 0) : int)
let myListToDict (lst : int list) =
  (Hashtbl.of_seq (List.to_seq (List.map (fun x -> (x, (x * x))) lst)) : 
  (int, int) Hashtbl.t)
let myDictToList (dict : (int, int) Hashtbl.t) =
  ((((dict |> Hashtbl.to_seq) |> List.of_seq) |>
      (List.sort (fun (k1, _) -> fun (k2, _) -> compare k1 k2)))
     |> (List.map (fun (k, v) -> k + v)) : int list)
let myPrintString (s : string) = (print_endline s : unit)
let myPrintStringList (lst : string list) =
  (List.iter (fun x -> print_string (x ^ " ")) lst; print_endline "" : 
  unit)
let myPrintIntList (lst : int list) =
  ((lst |> (List.map myIntToString)) |> myPrintStringList : unit)
let myPrintDict (dict : (int, int) Hashtbl.t) =
  (Hashtbl.iter
     (fun k ->
        fun v ->
          print_string
            ((myIntToString k) ^ ("->" ^ ((myIntToString v) ^ " ")))) dict;
   print_endline "" : unit)
;;myPrintString "Hello, World!"
;;myPrintString (myIntToString (myStringToInt "123"))
;;myPrintString (myDoubleToString (myStringToDouble "123.456"))
;;myPrintString (myBoolToString false)
;;myPrintString (myIntToString (myNullableToInt (myIntToNullable 18)))
;;myPrintString (myIntToString (myNullableToInt (myIntToNullable (-15))))
;;myPrintString (myIntToString (myNullableToInt (myIntToNullable 0)))
;;myPrintStringList (myListSorted ["e"; "dddd"; "ccccc"; "bb"; "aaa"])
;;myPrintStringList
    (myListSortedByLength ["e"; "dddd"; "ccccc"; "bb"; "aaa"])
;;myPrintString
    (myIntToString
       (myListReduce
          (myListMap (myListFilter [3; 12; 5; 8; 9; 15; 7; 17; 21; 11]))))
;;myPrintString
    (myIntToString (myListOperations [3; 12; 5; 8; 9; 15; 7; 17; 21; 11]))
;;myPrintDict (myListToDict [3; 1; 4; 2; 5; 9; 8; 6; 7; 0])
;;myPrintIntList
    (myDictToList
       (Hashtbl.of_seq
          (List.to_seq
             [(3, 9);
             (1, 1);
             (4, 16);
             (2, 4);
             (5, 25);
             (9, 81);
             (8, 64);
             (6, 36);
             (7, 49);
             (0, 0)])))