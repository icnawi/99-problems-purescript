module Utils where

import Prelude

import Data.List (List(..), (:))

revList :: ∀ a. List a -> List a
revList Nil = Nil
revList (x:xs) = (revList xs <> x:Nil)