module Test.Main where

import Prelude

import Data.List (List(..), (:))
import Effect (Effect)
import Main (myLength, myLength', myLength'')
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "Custom length function - Recursion 1" do
    test "Simple recursion => List Int" do
      Assert.assert "(33:453:905:75352:1223115:5362:Nil)" $ myLength (33:453:905:75352:1223115:5362:Nil) == 6
    test "Simple recursion => List Char" do
      Assert.assert "('H':'a':'s':'k':'e':'l':'l':Nil)" $ myLength ('H':'a':'s':'k':'e':'l':'l':Nil) == 7
    test "Simple recursion => List Char 1" do
      Assert.assert "('x':Nil)" $ myLength ('x':Nil) == 1
    test "Simple recursion => List Nil" do
      Assert.assert "Empty List" $ myLength Nil == 0

    test "Simple recursion => Array Int" do
      Assert.assert "[33,453,905,75352,1223115,5362]" $ myLength' [33,453,905,75352,1223115,5362] == 6
    test "Simple recursion => Array String" do
      Assert.assert "[\"apple\", \"banana\", \"cherry\"] should have length 3" $ myLength' ["apple", "banana", "cherry"] == 3
    test "Simple recursion => Array String single" do
      Assert.assert "[\"foo\"] should have length 1" $ myLength' ["foo"] == 1
    test "Simple recursion => Array Empty" do
      Assert.assert "Empty Array should have length 0" $ myLength' [] == 0

    test "Simple recursion => String" do
      Assert.assert "\"PureScript\" should have length 10" $ myLength'' "PureScript" == 10
    test "Simple recursion => String (mixed chars)" do
      Assert.assert "\"Hello, World!\" should have length 13" $ myLength'' "Hello, World!" == 13
    test "Simple recursion => String with only Char" do
      Assert.assert "\"A\" should have length 1" $ myLength'' "A" == 1
    test "Simple recursion => Empty String" do
      Assert.assert "Empty String should have length 0" $ myLength'' "" == 0

