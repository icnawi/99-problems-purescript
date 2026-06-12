module Main
  ( main
  , myLast
  , myLast'
  , myLast'''
  )
  where

import Prelude

import Data.Array (length, reverse, (!!))
import Data.Array.Partial (head, tail)
import Data.List (List(..), (:))
import Data.Maybe (Maybe)
import Effect (Effect)
import Effect.Class.Console (logShow)
import Partial.Unsafe (unsafeCrashWith, unsafePartial)

main ∷ Effect Unit
main = do 
  logShow $ unsafePartial $ myLast''' [12,34,52]

myLast ∷ ∀ a. Partial => Array a -> a
myLast [] = unsafeCrashWith "No end for empty arrays!"
myLast [x] = x
myLast xs = myLast (tail xs)

myLast' ∷ ∀ a. Partial => List a -> a
myLast' Nil = unsafeCrashWith "No end for empty lists!"
myLast' (x : Nil) = x
myLast' (_:xs) = myLast' xs

myLast'' ∷ ∀ a. Partial => Array a →  a
myLast'' = head <<< reverse

myLast''' ∷ ∀ a. Array a -> Maybe a
myLast''' xs = xs !! (length xs - 1)