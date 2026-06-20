module Test.Main where

import Prelude

import Data.List (List(..), (:))
import Effect (Effect)
import Main (myCompress, myCompress', myCompress'', myCompress''')
import Partial.Unsafe (unsafePartial)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "Custom compress function: Partial" do
    test "`foldl` version => Array Char" do
      Assert.assert "['a','a','a','a','b','c','c','a','a','d','e','e','e','e'] should equal ['a','b','c','a','d','e']" $ unsafePartial $ myCompress ['a','a','a','a','b','c','c','a','a','d','e','e','e','e'] == ['a','b','c','a','d','e']
  suite "Custom compress function" do
    test "Recursion $ `dropWhile` version => List Char" do
      Assert.assert "('a':'a':'a':'a':'b':'c':'c':'a':'a':'d':'e':'e':'e':'e':Nil) should equal ('a' : 'b' : 'c' : 'a' : 'd' : 'e' : Nil)" $ myCompress' ('a':'a':'a':'a':'b':'c':'c':'a':'a':'d':'e':'e':'e':'e':Nil) == ('a' : 'b' : 'c' : 'a' : 'd' : 'e' : Nil)
    test "`group`` `map` `head` version => Array Int" do
      Assert.assert "[1,1,1,2,3,3,1,1,4,5,5,5,5] should equal [1,2,3,1,4,5]" $ myCompress'' [1,1,1,2,3,3,1,1,4,5,5,5,5] == [1,2,3,1,4,5]
    test "`group`` `map` `head` version => String" do
      Assert.assert "\"aaaabccaadeeee\" should equal \"abcade\"" $ myCompress''' "aaaabccaadeeee" == "abcade"

  
