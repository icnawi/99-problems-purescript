module Main where

import Prelude

import Data.Array.Partial (tail)
import Data.List (List(..), (:))
import Effect (Effect)
import Effect.Console (log)
import Partial.Unsafe (unsafeCrashWith, unsafePartial)

main ∷ Effect Unit
main = do
  log $ show $ unsafePartial myLast [10000, 23000, 42]
  log $ show $ unsafePartial myLast' (124 : 52 : 4 : Nil)

myLast ∷ forall a. Partial => Array a -> a
myLast [] = unsafeCrashWith "No end for empty arrays!"
myLast [x] = x
myLast xs = myLast (tail xs)

myLast' ∷ forall a. Partial => List a -> a
myLast' Nil = unsafeCrashWith "No end for empty lists!"
myLast' (x : Nil) = x
myLast' (_:xs) = myLast' xs