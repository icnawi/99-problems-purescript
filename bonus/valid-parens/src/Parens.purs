module Parens
  ( isValidParens
  , strToListChar
  )
  where

import Prelude

import Data.Foldable (lookup)
import Data.List (List(..), fromFoldable, null, (:))
import Data.Maybe (Maybe(..))
import Data.String.CodeUnits (toCharArray)
import Data.Tuple (Tuple(..))


isValidParens :: String -> Boolean
isValidParens xs = isBalanced (strToListChar xs) Nil

strToListChar ∷ String →  List Char
strToListChar xs = fromFoldable $ toCharArray xs

isBalanced :: List Char -> List Char -> Boolean
isBalanced Nil x = null x

isBalanced (c:xs) ys 
  | Just d <- lookup c [ Tuple '(' ')', Tuple '[' ']', Tuple '{' '}', Tuple '<' '>' ] = isBalanced xs (d:ys)

isBalanced _ Nil = false
isBalanced (x:xs) (y:ys) = x == y && isBalanced xs ys