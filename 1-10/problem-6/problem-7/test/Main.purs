module Test.Main where

import Prelude

import Data.List (List(..), (:))
import Data.String.CodeUnits (fromCharArray)
import Effect (Effect)
import Main (ArrayNested(..), ListNested(..), myFlatten, myFlatten', myFlatten'', myFlatten''')
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "Custom flatten Array/List function" do
    test "Array: `concatMap`" do
      Assert.assert "[1, [2, [3, 4], 5]] should equal [1,2,3,4,5]" $ myFlatten (ArrayN [AElem 1, ArrayN [AElem 2, ArrayN [AElem 3, AElem 4], AElem 5]]) == [1,2,3,4,5]
    test "Array 2D - 1 item: `foldr + map`" do
      Assert.assert "[[1]] should equal [1]" $ myFlatten''' (ArrayN [AElem 1]) == [1]
    test "Array 1D - 1 item: `foldr + map`" do
      Assert.assert "[1] should equal [1]" $ myFlatten''' (AElem 1) == [1]
    test "Array Char: `foldr + map`" do
      Assert.assert "['H', ['e', ['l', 'l'],'o']]  should equal \"Hello\"" $ fromCharArray (myFlatten''' (ArrayN [AElem 'H', ArrayN [AElem 'e', ArrayN [AElem 'l', AElem 'l'], AElem 'o']])) == "Hello"
    test "List 1D - 1 item: recursion" do
      Assert.assert "(1:Nil) should equal (1:Nil)" $ myFlatten' (LElem 1) == 1:Nil
    test "List 2D - 1 item: recursion" do
      Assert.assert "1:(1:Nil):Nil should equal (1:Nil)" $ myFlatten' (ListN ((LElem 1):Nil)) == 1:Nil
    test "List: `pure` + flipped >>=" do
      Assert.assert "1:(2:(3:4:Nil):5:Nil):Nil should equal (1:2:3:4:5:Nil)" $ myFlatten'' ( ( ListN ( (LElem 1) : (ListN ( (LElem 2) : (ListN ( (LElem 3) : (LElem 4) : Nil )) : Nil )) : (LElem 5) : Nil ) ) ) == (1:2:3:4:5:Nil)
