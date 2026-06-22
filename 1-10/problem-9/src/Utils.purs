module Utils
  ( splitAtLs
  )
  where

import Prelude

import Data.List (List(..), length, slice)


splitAtLs :: forall a. Int -> List a -> { before :: List a, after :: List a }
splitAtLs i xs | i <= 0 = { before: Nil, after: xs }
splitAtLs i xs = { before: slice 0 i xs, after: slice i (length xs) xs }