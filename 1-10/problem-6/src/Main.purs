module Main
  ( isPalindrome
  , isPalindrome''
  , isPalindrome'''
  , isPalindrome''''
  , isPalindrome'''''
  , isPalindrome''''''
  , isPalindrome'''''''
  , main
  )
  where

import Prelude

import Data.Array (foldr, reverse, zipWith)
import Data.List (List(..), head, init, last, tail, (:))
import Data.Maybe (fromMaybe)
import Data.Profunctor.Strong ((&&&))
import Data.String.CodeUnits (toCharArray)
import Data.Tuple (uncurry)
import Effect (Effect)
import Effect.Console (logShow)
import Utils (revList)

main :: Effect Unit
main = do
  logShow $ isPalindrome''''''' [1,2,3,2,1]
  logShow $ isPalindrome'''''' "madamimadam"
  logShow $ isPalindrome (1:2:1:Nil)

-- Variant 1: Simple reverse List == List comparison
isPalindrome :: ∀ a. Eq a => List a -> Boolean
isPalindrome xs = revList xs == xs

-- Variant 2: `head` + `last` comparison within recursive destructuring of palindromic List
isPalindrome'' :: ∀ a. Eq a => List a -> Boolean
isPalindrome'' Nil = false
isPalindrome'' (_:Nil) = true
isPalindrome'' xs = (head xs) == (last xs) && (isPalindrome'' $ fromMaybe Nil <<< init $ fromMaybe Nil <<< tail $ xs)

-- Variant 3: `foldr` + `zipWith` using `reverse` combo on Array
isPalindrome''' :: ∀ a. Eq a => Array a -> Boolean
isPalindrome''' xs = foldr (&&) true $ zipWith (==) xs (reverse xs)

-- Variant 4: Applicative functor implementation
isPalindrome'''' :: ∀ a. Eq a => Array a -> Boolean
isPalindrome'''' = (==) <*> reverse

-- Variant 5: Monadic implementation
isPalindrome''''' :: ∀ a. Eq a => Array a -> Boolean
isPalindrome''''' = reverse >>= (==)

-- Variant 6: Monadic implementation with mapping String -> [Char]
isPalindrome'''''' :: String -> Boolean
isPalindrome'''''' = isPalindrome''''' <<< toCharArray 

-- Variant 7: Profunctor.Strong implementation using fan-out (&&&) operator
isPalindrome''''''' :: ∀ a. Eq a => Array a -> Boolean
isPalindrome''''''' xs = (uncurry (==) <<< (identity &&& reverse)) xs