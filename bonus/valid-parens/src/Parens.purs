module Parens
  ( isValidParens
  )
  where

import Prelude

import Data.Foldable (lookup)
import Data.List (List(..), null, (:))
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Utils (stringToCharList)


isValidParens :: String -> Boolean
isValidParens xs = isBalanced (stringToCharList xs) Nil

isBalanced :: List Char -> List Char -> Boolean
isBalanced Nil x = null x

isBalanced (c:xs) ys 
  | Just d <- lookup c [ '(' /\ ')', '[' /\ ']', '{' /\ '}', '<' /\ '>' ] = isBalanced xs (d:ys)

isBalanced _ Nil = false
isBalanced (x:xs) (y:ys) = x == y && isBalanced xs ys