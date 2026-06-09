module Utils
  ( stringToCharList
  )
  where

import Prelude

import Data.List (List, fromFoldable)
import Data.String.CodeUnits (toCharArray)


stringToCharList ∷ String →  List Char
stringToCharList xs = fromFoldable $ toCharArray xs