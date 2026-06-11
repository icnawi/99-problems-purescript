module Test.Main where

import Prelude

import Data.List (List(..), (:))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Main (myLast, myLast', myLast''')
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
    test "Strings" do
      Assert.assert "[\"apple\", \"banana\", \"cherry\"] should be \"cherry\"" $ unsafePartial (myLast ["apple", "banana", "cherry"]) == "cherry"
      Assert.equal "cherry" (unsafePartial (myLast ["apple", "banana", "cherry"]))
    test "Single element" do
      Assert.assert "[\"cherry\"] should be \"cherry\"" $ unsafePartial (myLast ["cherry"]) == "cherry"
      Assert.equal "cherry" (unsafePartial (myLast ["cherry"]))

  suite "The last element of Linked List" do
    test "Integers" do
      Assert.assert "(1 : 2 : 3 : 4 : Nil) should be 4" $ unsafePartial (myLast' (1 : 2 : 3 : 4 : Nil)) == 4
      Assert.equal 4 (unsafePartial (myLast' (1 : 2 : 3 : 4 : Nil)))
    test "Chars" do
      Assert.assert "('x' : 'y' : 'z' : Nil) should be 'z'" $ unsafePartial (myLast' ('x' : 'y' : 'z' : Nil)) == 'z'
      Assert.equal 'z' (unsafePartial (myLast' ('x' : 'y' : 'z' : Nil)))
    test "Strings" do
      Assert.assert "(\"apple\" : \"banana\" : \"cherry\" : Nil) should be \"cherry\"" $ unsafePartial (myLast' ("apple" : "banana" : "cherry" : Nil)) == "cherry"
      Assert.equal "cherry" (unsafePartial (myLast' ("apple" : "banana" : "cherry" : Nil)))
    test "Single element" do
      Assert.assert "(\"cherry\" : Nil) should be \"cherry\"" $ unsafePartial (myLast' ("cherry" : Nil)) == "cherry"
      Assert.equal "cherry" (unsafePartial (myLast' ("cherry" : Nil)))

  suite "The last element of Array with Maybe" do
    test "Integers" do
      Assert.assert "[1,2,3,4] should be \"4\"" $ myLast''' [1,2,3,4] == Just 4
      Assert.equal (Just 4) (myLast''' [1,2,3,4])


