module Parens where

import Prelude

import Data.Foldable(lookup)
import Data.Maybe(Maybe(..))
import Data.List(List(..), null, (:))
import Data.Tuple(Tuple(..))


-- isValidParens :: String -> Boolean
isValidParens xs = isBalanced xs Nil

-- isBalanced :: String -> String -> Boolean
isBalanced Nil x = null x

isBalanced (c:xs) ys 
  | Just d <- lookup c [ Tuple '(' ')', Tuple '[' ']', Tuple '{' '}' ] = isBalanced xs (Cons d ys)

isBalanced _ Nil = false
isBalanced (x:xs) (y:ys) = x == y && isBalanced xs ys