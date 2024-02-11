module Main where

import Prelude 
import Effect (Effect)
import Effect.Console (log)
import Data.List

hello :: Effect Unit
hello = 
    log "Hello World!"

myFunction :: List Int -> String
myFunction myList =
    myList # filter (\x -> x `mod` 2 == 0) 
        # map (\x -> show (x * 3))
        # foldl (\x y -> y <> x <> y) ""
          
main :: Effect Unit
main = do
    hello 
    log (myFunction(1 : 2 : 3 : 4 : 5 : Nil))
