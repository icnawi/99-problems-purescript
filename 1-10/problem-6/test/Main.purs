module Test.Main where

import Prelude

import Data.List (List(..), (:))
import Effect (Effect)
import Main (isPalindrome, isPalindrome'', isPalindrome''', isPalindrome'''', isPalindrome''''', isPalindrome'''''', isPalindrome''''''')
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "Checking whether a data structure is palindromic" do
    test "Arrays: foldr+zipWith, Applicative, Monad, Profunctor" do
      Assert.assert "`foldr` + `zipWith`: [1,3,5,7,9,11,9,7,5,3,1] should be true" $ isPalindrome''' [1,3,5,7,9,11,9,7,5,3,1] == true
      Assert.assert "Applicative: [\"apple\",\"banana\",\"cherry\",\"banana\",\"apple\"] should be true" $ isPalindrome'''' ["apple","banana","cherry","banana","apple"] == true
      Assert.assert "Monad: [false, true, false] should be true" $ isPalindrome''''' [false, true, false] == true
      Assert.assert "Profunctor: [1112, 1122, 1222, 2222, 2221, 2211, 2111] should be false" $ isPalindrome''''''' [1112, 1122, 1222, 2222, 2221, 2211, 2111] == false
      Assert.assert "Monad: [999] should be true" $ isPalindrome''''' [999] == true
      -- Assert.assert "Applicative: [] should be true" $ isPalindrome''''' [] == true

  suite "Lists: classic + recursive" do
    test "Classic: Revesed List equals original" do
      Assert.assert "('a':'b':'c':'d':'c':'b':'a':Nil) should be true" $ isPalindrome ('a':'b':'c':'d':'c':'b':'a':Nil) == true
    test "`head` + `last` + recursion" do
      Assert.assert "(1:2:4:8:16:8:4:2:1:Nil) should be true" $ isPalindrome'' (1:2:4:8:16:8:4:2:1:Nil) == true
    test "`head` + `last` + recusion - non-palindromic" do
      Assert.assert "" $ isPalindrome'' ('h':'a':'s':'k':'e':'l':'l':Nil) == false 

  suite "Strings: Monadic" do
    test "Monad: map String to [Char]" do
      Assert.assert "\"madamimadam\" should be true" $ isPalindrome'''''' "madamimadam" == true
    -- test "Sentence" do
      -- Assert.assert "\"A man, a plan, a canal, panama!\" should be true" $ isPalindrome'''''' "A man, a plan, a canal, panama!" == true
    test "`head` + `last` + recusion - non-palindromic" do
      Assert.assert "Single char in string should be true" $ isPalindrome'''''' "A" == true
      Assert.assert "Empty string should be true" $ isPalindrome'''''' "" == true

