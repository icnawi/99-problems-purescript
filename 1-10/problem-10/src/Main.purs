module Main where

import Prelude

import Data.Array as A
import Data.Array.NonEmpty as NE
import Data.Foldable as F
import Data.List (List(..), (:))
import Data.List as L
import Data.Maybe (Maybe(..))
import Data.Profunctor.Strong ((&&&))
import Data.String.CodeUnits (toCharArray)
import Data.Tuple (Tuple)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Console (logShow)
import Pack (myPack)


main :: Effect Unit
main = do
  logShow $ myEncode ('a':'b':'c':'d':'e':Nil)
  -- logShow $ unsafePartial $ myEncode' [true, true, true, false, false, true, false]
  -- logShow $ myEncode'' ['H','a','s','k','e','l','l']
  -- logShow $ myEncode''' [1,1,1,1,2,3,3,1,1,4,5,5,5,5]
  -- logShow $ myEncode'''' "aaaabccaadeeee" 
  -- logShow $ unsafePartial $ myEncode''''' ((1 : 1 : 1 : 1 : Nil) : (2 : Nil) : (3 : 3 : Nil) : (1 : 1 : Nil) : (4 : Nil) : (5 : 5 : 5 : 5 : Nil) : Nil)


myEncode :: ∀ a. Eq a => List a -> List (Tuple Int a)
myEncode Nil = Nil
myEncode (x:xs) = ((L.length $ x : L.takeWhile (_ == x) xs) /\ x) : myEncode (L.dropWhile (_ == x) xs)

-- Based on one of the `myPack` implementations


myEncode' ∷ ∀ a. Eq a => Partial => Array a -> Array (Tuple Int a)
myEncode' xs = (enc <<< myPack) xs
  where 
    enc = F.foldr (\x acc -> (A.length x /\ h x) A.: acc) []
    h a = case A.head a of
      Just y -> y
 
myEncode'' :: ∀ a. Eq a => Array a -> Array (Tuple Int a)
myEncode'' xs = map (NE.length &&& NE.head) $ A.group xs

myEncode''' :: ∀ a. Eq a => Array a -> Array (Tuple Int a)
myEncode''' = map (\x -> NE.length x /\ NE.head x) <<< A.group

myEncode'''' ∷ Eq String => String -> Array (Tuple Int Char)
myEncode'''' "" = []
myEncode'''' xs = A.zip (map NE.length len) h 
  where
    len = (A.group <<< toCharArray) xs
    h = map NE.head len

myEncode''''' :: ∀ a. Partial => List (List a) -> List (Tuple Int a)
myEncode''''' = let f acc Nil = acc 
                    f acc (x:xs) = f ((L.length x /\ h x) : acc) xs
                in  L.reverse <<< f Nil
                where
                  h a = case L.head a of
                    Just y -> y