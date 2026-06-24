module Main
  ( main
  , myPack
  , myPack'
  , myPack''
  , myPack'''
  , myPack''''
  )
  where

import Prelude

import Data.Array as AR
import Data.List (List(..), (:))
import Data.List as LS
import Data.Maybe (Maybe(..), maybe)
import Data.String (length)
import Data.String.CodeUnits (fromCharArray, toCharArray)
import Effect (Effect)
import Effect.Console (logShow)
import Utils (splitAtLs)


main :: Effect Unit
main = do
  logShow $ myPack''' (1:1:1:1:2:2:2:3:3:5:5:5:5:1:1:4:4:4:4 : Nil)
  logShow $ myPack'''' [1,1,1,1,2,2,2,3,3,5,5,5,5,1,1,4,4,4,4]

myPack :: ∀ a. Eq a => List a -> List (List a)
myPack Nil = Nil
myPack (x:Nil) = (x:Nil) : Nil
myPack (x LS.: xs) = 
    let { init, rest } = LS.span (_ == x) xs
    in (x LS.: init) : myPack rest


myPack' :: ∀ a. Eq a => Array a -> Array (Array a)
myPack' [] = []
myPack' [x] = [[x]]
myPack' arr = case AR.uncons arr of
    Just { head: x, tail: xs } -> 
      let { init, rest } = AR.span (_ == x) xs 
      in (x AR.: init) AR.: myPack' rest
    Nothing -> []


myPack'' :: String -> Array String
myPack'' xs | (length xs) == 1 = [xs] 
myPack'' xs = (map (fromCharArray) <<< myPack' <<< toCharArray) xs

-- For less pattern matching, implemented `splitAt` for List
myPack''' :: ∀ a. Eq a => List a -> List (List a)
myPack''' Nil = Nil
myPack''' (x:xs) = (x:reps) : (myPack''' rest)
    where
        { before: reps
        , after: rest 
        } = maybe 
            { before: xs
            , after: Nil 
            } (\i -> splitAtLs i xs) 
                (LS.findIndex (_ /= x) xs)

myPack'''' :: ∀ a. Eq a => Array a -> Array (Array a)
myPack'''' [] = []
myPack'''' arr = case AR.uncons arr of
    Just { head: x, tail: xs } -> 
        (x AR.: AR.takeWhile (_ == x) xs) AR.: myPack'''' (AR.dropWhile (_ == x) xs)
    Nothing -> []
    
