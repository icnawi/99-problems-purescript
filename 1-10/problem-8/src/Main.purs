module Main where

import Prelude

import Data.Array (cons, foldl, group, reverse)
import Data.Array.NonEmpty as NonEmptyArray
import Data.Array.Partial (head)
import Data.List (List(..), dropWhile, (:))
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Effect (Effect)
import Effect.Console (logShow)
import Partial.Unsafe (unsafePartial)

main :: Effect Unit
main = do
  logShow $ unsafePartial $ myCompress ['a','a','a','a','b','c','c','a','a','d','e','e','e','e']
  logShow $ myCompress' ('a':'a':'a':'a':'b':'c':'c':'a':'a':'d':'e':'e':'e':'e':Nil)
  logShow $ myCompress'' ['a','a','a','a','b','c','c','a','a','d','e','e','e','e']
  logShow $ myCompress''' "aaaabccaadeeee"


myCompress :: ∀ a. Eq a => Partial => Array a -> Array a
myCompress xs = reverse $ foldl (\a b -> if (head a) == b then a else cons b a) [head xs] xs

myCompress' :: ∀ a. (Eq a) => List a -> List a
myCompress' Nil = Nil
myCompress' (x:xs) = x : (myCompress' $ dropWhile (_ == x) xs)

myCompress'' :: ∀ a. Eq a => Array a -> Array a
myCompress'' = map NonEmptyArray.head <<< group

myCompress''' :: Eq String => String -> String
myCompress''' = fromCharArray <<< (map NonEmptyArray.head  <<< group) <<< toCharArray

