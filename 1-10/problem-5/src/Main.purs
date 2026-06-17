module Main
  ( main
  , myReverse
  , myReverse'
  , myReverse''
  , myReverse'''
  )
  where

import Prelude

import Data.Array (cons)
import Data.Foldable (class Foldable, foldl)
import Data.List (List(..), (:))
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Effect (Effect)
import Effect.Console (logShow)

main :: Effect Unit
main = do
  logShow $ myReverse''' "Hello"

myReverse :: ∀ a. List a -> List a
myReverse Nil = Nil
myReverse (x:xs) = myReverse xs <> x:Nil


myReverse' :: ∀ f a. Foldable f => f a -> Array a
myReverse' = foldl (\a x -> cons x a) []

-- additional `foldl` version
myReverse'' :: ∀ f a. Foldable f ⇒  f a -> Array a
myReverse'' = foldl (flip cons) []

-- String
myReverse''' :: String -> String
myReverse''' = fromCharArray <<< myReverse'' <<< toCharArray 