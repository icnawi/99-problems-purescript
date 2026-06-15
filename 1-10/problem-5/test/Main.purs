module Test.Main where

import Prelude

import Data.List (List(..), (:))
import Effect (Effect)
import Main (myReverse, myReverse', myReverse'', myReverse''')
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "Custom reverse function via recursion" do
    test "Simple recursion => List Char" do
      Assert.assert "('a':'b':'c':'d':'e':Nil) should equal ('e':'d':'c':'b':'a':Nil)" $ myReverse ('a':'b':'c':'d':'e':Nil) == ('e':'d':'c':'b':'a':Nil)
  suite "Foldable version" do
    test "`foldl` version 1 => Array Int" do
      Assert.assert "[252,838,342,425] should equal [425,342,838,252]" $ myReverse' [252,838,342,425] == [425,342,838,252]
    test "`foldl` version 2 => Array Int" do
      Assert.assert "[252,838,342,425] should equal [425,342,838,252]" $ myReverse'' [99,11,33,66] == [66,33,11,99]
    test "`foldl` version => String" do
      Assert.assert "\"A man, a plan, a canal, panama!\" should equal \"!amanap ,lanac a ,nalp a ,nam A\"" $ myReverse''' "A man, a plan, a canal, panama!" == "!amanap ,lanac a ,nalp a ,nam A"

  