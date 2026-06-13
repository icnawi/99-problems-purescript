module Main
  ( main
  )
  where

import Prelude

import Data.List (range)
import Effect (Effect)
import Effect.Console (log)
import Quicksort (quicksort)
-- import QuicksortArray (QuicksortArray)
main :: Effect Unit
main = do
  let unsorted = range 10 1
  log $ show $ quicksort unsorted
  -- log $ show $ quicksortArray 1..20