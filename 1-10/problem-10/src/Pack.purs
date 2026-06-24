module Pack where

import Prelude

import Data.Array as A
import Data.Maybe (Maybe(..))

myPack :: ∀ a. Eq a => Array a -> Array (Array a)
myPack [] = []
myPack [x] = [[x]]
myPack arr = case A.uncons arr of
  Just { head: x, tail: xs } -> let { init, rest } = A.span (_ == x) xs 
                                in (x A.: init) A.: myPack rest
  Nothing -> []
