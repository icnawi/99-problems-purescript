module Quicksort where

import Prelude

import Data.List (List(..), (:), partition)


quicksort :: forall a. Ord a => List a -> List a
quicksort Nil = Nil
quicksort (x:xs) 
  | { yes: lesser, no: greater } <- partition (_ <= x) xs = quicksort lesser <> x : Nil <> quicksort greater