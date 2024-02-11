import sequtils
import strutils

proc hello() =
  echo "Hello World!"

proc myFunction(myList: seq[int]): string =
  result = myList.filterIt(it mod 2 == 0)
    .mapIt(intToStr(it * 3))
    .foldl(b & a & b, "")

hello()
echo myFunction(@[1, 2, 3, 4, 5])