module Main
  ( main
  )
  where

import Prelude

import Data.List (List(..), partition, (:))
import Effect (Effect)
import Effect.Console (log)

main :: Effect Unit
main = do
  let unsorted = 4:1:7:2:10:3:9:5:8:6:Nil
  log $ show $ quicksort unsorted

quicksort :: forall a. Ord a => List a -> List a
quicksort Nil = Nil
quicksort (x:xs) 
  | { yes: lesser, no: greater } <- partition (_ <= x) xs = quicksort lesser <> x : Nil <> quicksort greater
