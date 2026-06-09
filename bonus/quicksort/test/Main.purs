module Test.Main where

import Prelude

import Data.List (List(..), range, (:))
import Effect (Effect)
import Quicksort (quicksort)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main ∷ Effect Unit
main = runTest do
  suite "Quicksort" do
    test "DESC -> ASC sorting" do
      Assert.assert "(10 : 9 : 8 : 7 : 6 : 5 : 4 : 3 : 2 : 1 : Nil) should be (1 : 2 : 3 : 4 : 5 : 6 : 7 : 8 : 9 : 10 : Nil)" $ quicksort (range 10 1) == range 1 10
      Assert.equal (range 1 10) (quicksort (range 10 1))
    test "Shuffled linked list sorting" do
      Assert.assert "(7 : 3 : 9 : 1 : 5 : Nil) should be (1 : 3 : 5 : 7 : 9 : Nil)" $ quicksort (7 : 3 : 9 : 1 : 5 : Nil) == (1 : 3 : 5 : 7 : 9 : Nil)
      Assert.equal (1 : 3 : 5 : 7 : 9 : Nil) (quicksort (7 : 3 : 9 : 1 : 5 : Nil))
    test "With negative integers sorting" do
      Assert.assert "(1 : -2 : 2 : -1 : 0 : Nil) should be (-2 : -1 : 0 : 1 : 2 : Nil)" $ quicksort (1 : -2 : 2 : -1 : 0 : Nil) == (-2 : -1 : 0 : 1 : 2 : Nil)
      Assert.equal (-2 : -1 : 0 : 1 : 2 : Nil) (quicksort (1 : -2 : 2 : -1 : 0 : Nil))

