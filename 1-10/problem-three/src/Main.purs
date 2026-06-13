module Main
  ( elementAt
  , elementAt'
  , elementAt''
  , elementAt'''
  , elementAt''''
  , elementAt'''''
  , main
  )
  where

import Prelude

import Data.Array (foldr, last, replicate, zip, (..))
import Data.Array.Partial (head, tail)
import Data.List (List(..), (!!), (:))
import Data.Maybe (Maybe(..))
import Data.String (length, take)
import Data.String.CodeUnits (charAt, toCharArray)
import Data.Tuple (fst)
import Effect (Effect)
import Effect.Class.Console (logShow)
import Partial.Unsafe (unsafeCrashWith)


main :: Effect Unit
main = do
  logShow $ elementAt'''' "Haskell" (3)


elementAt ∷ ∀ a. List a -> Int -> Maybe a
elementAt xs x = xs !! (x - 1)

elementAt' ∷ ∀ a. List a -> Int -> a
elementAt' (x:_) 1   = x
elementAt' Nil _     = unsafeCrashWith "Index out of bounds"
elementAt' (_:xs) k 
  | k < 1            = unsafeCrashWith "Index out of bounds"
  | otherwise        = elementAt' xs (k - 1)

elementAt'' ∷ String -> Int -> Maybe Char
elementAt'' "" _ = unsafeCrashWith "Index out of bounds"
elementAt'' xs x = charAt (x - 1) xs

elementAt''' :: String -> Int -> Char
elementAt''' xs n
  | length xs < n = unsafeCrashWith "Index out of bounds"
  | otherwise     = 
      case last $ zip (toCharArray xs) $ 1..n of
          Just x -> fst x
          Nothing -> 'H'

elementAt'''' :: String -> Int -> Char
elementAt'''' xs n
  | length xs < n = unsafeCrashWith "Index out of bounds"
  | otherwise     = 
      case last $ toCharArray $ take n xs of
          Just x -> x
          Nothing -> 'H'

elementAt''''' :: ∀ a. Partial => Array a -> Int -> a
elementAt''''' xs n = head $ foldr ($) xs $ replicate (n - 1) tail