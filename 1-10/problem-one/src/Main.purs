module Main where

import Prelude

import Data.Array.Partial (tail)
import Effect (Effect)
import Effect.Console (log)
import Partial.Unsafe (unsafeCrashWith, unsafePartial)

main ∷ Effect Unit
main = do
  let numbers = [1, 2, 3, 4]
  log $ show $ unsafePartial myLast numbers

myLast ∷ forall a. Partial => Array a -> a
myLast [] = unsafeCrashWith "No end for empty lists!"
myLast [x] = x
myLast xs = myLast (tail xs)