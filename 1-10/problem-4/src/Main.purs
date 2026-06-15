module Main
  ( main
  , myLength
  , myLength'
  , myLength''
  , myLength'''
  , myLength''''
  , myLength'''''
  , myLength''''''
  )
  where

import Prelude

import Data.Array (last, tail, zip, (..))
import Data.Foldable (class Foldable, foldl, foldr, sum)
import Data.List (List(..), (:))
import Data.Maybe (fromMaybe, maybe)
import Data.String (codePointFromChar, uncons)
import Data.Tuple (fst)
import Effect (Effect)
import Effect.Console (logShow)

main :: Effect Unit
main = do
  logShow $ myLength'''''' ['a', 'o', 'c']

-- Simple Recursion
myLength :: forall a. List a -> Int
myLength Nil = 0
myLength (_:xs) = 1 + myLength xs

myLength' :: ∀ a. Array a -> Int
myLength' [] = 0
myLength' xs = 1 + (myLength' <<< fromMaybe [] <<< tail) xs

myLength'' :: String -> Int
myLength'' "" = 0
myLength'' xs = 1 + myLength'' ( ( ( fromMaybe {head: codePointFromChar 'A', tail: ""} <<< uncons ) xs ).tail )

-- Mapping all elements to "1" using Foldable
myLength''' :: ∀ f a. Foldable f => Functor f => f a -> Int
myLength''' = sum <<< map (\_ -> 1)

-- Point-free is also fun
myLength'''' :: ∀ a. Array a -> Int
myLength'''' = maybe 0 fst <$> last <<< zip (1 .. 39423) {- Simulating Infinite Array of integers here, due to infinity is Number type and not Int -}

-- Another point-free variant RTL folding
myLength''''' :: ∀ f b. Foldable f => f b -> Int
myLength''''' = foldr ((+) <<< (const 1)) 0

-- LTR folding
myLength'''''' :: ∀ f b. Foldable f => f b -> Int
myLength'''''' = foldl (const <<< (+) 1) 0