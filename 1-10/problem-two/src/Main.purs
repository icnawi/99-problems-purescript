module Main
  ( main
  , myButLast
  , myButLast'
  , myButLast''
  , myButLast'''
  , myButLast''''
  , myButLast'''''
  , myButLast''''''
  )
  where

import Prelude

import Data.Array (reverse, (!!), (..))
import Data.Array.Partial (head, init, last, tail)
import Data.Foldable (class Foldable, foldl)
import Data.List (List(..), (:))
import Data.Maybe (Maybe(..))
import Data.Tuple (fst)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Console (logShow)
import Partial.Unsafe (unsafeCrashWith)

main :: Effect Unit
main = do
  logShow $ myButLast'''''' $ 1 .. 100

-- Partial Arrays
myButLast :: ∀ a. Partial => Array a →  a
myButLast = last <<< init

myButLast'''' :: ∀ a. Partial => Array a →  a
myButLast'''' = head <<< tail <<< reverse

myButLast''''' :: ∀ a. Partial => Array a →  a
myButLast''''' = head <<< reverse <<< init

myButLast'' :: ∀ a. Partial => Array a -> a
myButLast'' []  = unsafeCrashWith "No end for empty arrays!"
myButLast'' [x, _] = x
myButLast'' xs = myButLast'' (tail xs)

-- Partial Lists
myButLast''' :: ∀ a. Partial => List a -> a
myButLast''' Nil  = unsafeCrashWith "No end for empty lists!"
myButLast''' (x:_:Nil) = x
myButLast''' (_:xs) = myButLast''' xs

-- Maybe Array
myButLast' :: ∀ a. Array a -> Maybe a 
myButLast' xs = reverse xs !! 1 

-- Foldable
myButLast'''''' :: ∀ f a. Foldable f => f a -> Maybe a
myButLast'''''' = fst <<< foldl (\(_ /\ b) x -> b /\ (Just x)) (Nothing /\ Nothing)

