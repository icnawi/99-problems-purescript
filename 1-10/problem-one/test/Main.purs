module Test.Main where

import Prelude

import Effect (Effect)
import Main (myLast)
import Partial.Unsafe (unsafePartial)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "The last element of Array" do
    test "Integers" do
      Assert.assert "[1,2,3,4] should be 4" $ unsafePartial (myLast [1,2,3,4]) == 4
      Assert.equal 4 (unsafePartial (myLast [1, 2, 3, 4]))
    test "Chars" do
      Assert.assert "['x', 'y', 'z'] should be 'z'" $ unsafePartial (myLast ['x', 'y', 'z']) == 'z'
      Assert.equal 'z' (unsafePartial (myLast ['x','y','z']))


