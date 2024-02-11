import Data.List
import Data.Function 

hello :: IO ()
hello = putStrLn "Hello World!"

myFunction :: [Int] -> String
myFunction myList = 
    myList & filter (\x -> x `mod` 2 == 0)
    & map (\x -> show $ x * 3) 
    & foldl' (\x y -> y ++ x ++ y) "" 

main :: IO ()
main = hello
    >> putStrLn (myFunction [1,2,3,4,5])