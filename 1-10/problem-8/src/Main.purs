module Main where

import Prelude

import Data.Array as A
import Data.Array.NonEmpty as NE
import Data.Array.Partial as PA
import Data.List (List(..), (:))
import Data.List as L
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Effect (Effect)
import Effect.Console (logShow)

main :: Effect Unit
main = do
  logShow $ myCompress' ('a':'a':'a':'a':'b':'c':'c':'a':'a':'d':'e':'e':'e':'e':Nil)
  logShow $ myCompress'' ['a','a','a','a','b','c','c','a','a','d','e','e','e','e']
  logShow $ myCompress''' "aaaabccaadeeee"


myCompress :: ∀ a. Eq a => Partial => Array a -> Array a
myCompress xs = A.reverse $ A.foldl (\a b -> if (PA.head a) == b then a else A.cons b a) [PA.head xs] xs

myCompress' :: ∀ a. (Eq a) => List a -> List a
myCompress' Nil = Nil
myCompress' (x:xs) = x : (myCompress' $ L.dropWhile (_ == x) xs)

myCompress'' :: ∀ a. Eq a => Array a -> Array a
myCompress'' = map NE.head <<< A.group

myCompress''' :: Eq String => String -> String
myCompress''' = fromCharArray <<< map NE.head <<< A.group <<< toCharArray

