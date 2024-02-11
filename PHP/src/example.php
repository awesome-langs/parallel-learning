<?php

function hello() {
  print_r("Hello World!\n");
}

function myFunction(array $myList): string {
  return array_reduce(
      array_map(
          fn ($x) => strval($x * 3),
          array_filter(
              $myList,
              fn ($x) => $x % 2 == 0
          )
      ),
      fn ($x, $y) => $y . $x . $y,
      ''
  );
}

hello();
print_r(myFunction([1, 2, 3, 4, 5]));