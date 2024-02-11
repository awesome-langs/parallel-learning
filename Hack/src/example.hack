use HH\Lib\C;
use HH\Lib\Vec;

function hello(): void {
  echo "Hello World!\n";
}

function myFunction(vec<int> $myList): string {
    return $myList |> Vec\filter($$, $x ==> $x % 2 === 0)
        |> Vec\map($$, $x ==> strval($x * 3))        
        |> C\reduce($$, ($x, $y) ==> $y . $x . $y, '');
}

<<__EntryPoint>>
function main(): void {
  hello();
  echo myFunction(vec[1, 2, 3, 4, 5]);
}