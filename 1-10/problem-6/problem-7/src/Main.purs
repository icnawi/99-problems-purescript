module Main
  ( ArrayN
  , ArrayNested(..)
  , ListN
  , ListNested(..)
  , main
  , myFlatten
  , myFlatten'
  , myFlatten''
  , myFlatten'''
  )
  where

import Prelude

import Data.Array (concatMap, foldr)
import Data.List (List(..), (:))
import Effect (Effect)
import Effect.Console (logShow)
 
main :: Effect Unit
main = do
  logShow $ myFlatten''' (ArrayN [AElem 1, ArrayN [AElem 2, ArrayN [AElem 3, AElem 4], AElem 5]])
  -- logShow $ myFlatten' ( ListN ( (LElem 1):Nil ) )
  -- logShow $ myFlatten' ( ListN ( (LElem 1) : (ListN ( (LElem 2) : (ListN ( (LElem 3) : (LElem 4) : Nil )) : Nil )) : (LElem 5) : Nil ) )
  -- logShow $ myFlatten'' ( (LElem 5) )
  -- logShow $ myFlatten'' ( ( ListN ( (LElem 1) : (ListN ( (LElem 2) : (ListN ( (LElem 3) : (LElem 4) : Nil )) : Nil )) : (LElem 5) : Nil ) ) )
  


data ArrayNested a = AElem a | ArrayN (ArrayN a)
type ArrayN a = Array (ArrayNested a)

data ListNested a = LElem a | ListN (ListN a)
type ListN a = List (ListNested a)


-- Variant with `concatMap` on Array
myFlatten :: ∀ a. ArrayNested a -> Array a
myFlatten (AElem x) = [x]
myFlatten (ArrayN xs) = concatMap myFlatten xs

-- Variant without `concatMap` 
myFlatten' ∷ ∀ a. ListNested a -> List a
myFlatten' (LElem x) = x:Nil
myFlatten' (ListN (x:xs)) = myFlatten' x <> myFlatten' (ListN (xs))
myFlatten' (ListN Nil) = Nil

-- Variant with `pure` + flipped bind
myFlatten'' :: ∀ a. ListNested a -> List a
myFlatten'' (LElem x) = pure x
myFlatten'' (ListN xs) = myFlatten'' =<< xs

-- Variant with `foldr`
myFlatten''' :: ∀ a. ArrayNested a -> Array a
myFlatten''' (AElem x) = [x]
myFlatten''' (ArrayN xs) = foldr (<>) [] $ map myFlatten xs