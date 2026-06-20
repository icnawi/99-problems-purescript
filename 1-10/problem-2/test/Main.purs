module Test.Main where

import Prelude

import Data.Array ((..))
import Data.List (List(..), range, (:))
import Data.Maybe (Maybe(..))
import Effect (Effect)
import Main (myButLast, myButLast', myButLast'', myButLast''', myButLast'''', myButLast''''', myButLast'''''')
import Partial.Unsafe (unsafePartial)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "The last-but-one element of an Array" do
    test "Array Partial: last . init" do
      Assert.equal 3 $ unsafePartial (myButLast $ 1..4)
      Assert.equal 'o' $ unsafePartial (myButLast ['a', 'e', 'i', 'o', 'u'])
      Assert.equal true $ unsafePartial (myButLast [false, false, false, true, false])
      Assert.assert "[36, 63] should return 36" $ unsafePartial (myButLast [36, 63]) == 36
    test "Array Partial: head . tail . reverse" do
      Assert.equal 3 $ unsafePartial (myButLast'''' $ 1..4)
      Assert.equal 'o' $ unsafePartial (myButLast'''' ['a', 'e', 'i', 'o', 'u'])
      Assert.equal true $ unsafePartial (myButLast'''' [false, false, false, true, false])
      Assert.assert "[36, 63] should return 36" $ unsafePartial (myButLast'''' [36, 63]) == 36
    test "Array Partial: head . reverse . init" do
      Assert.equal 3 $ unsafePartial (myButLast''''' $ 1..4)
      Assert.equal 'o' $ unsafePartial (myButLast''''' ['a', 'e', 'i', 'o', 'u'])
      Assert.equal true $ unsafePartial (myButLast''''' [false, false, false, true, false])
      Assert.assert "[36, 63] should return 36" $ unsafePartial (myButLast''''' [36, 63]) == 36
    test "Array Partial: head : tail destructuring" do
      Assert.equal 3 $ unsafePartial (myButLast'' $ 1..4)
      Assert.equal 'o' $ unsafePartial (myButLast'' ['a', 'e', 'i', 'o', 'u'])
      Assert.equal true $ unsafePartial (myButLast'' [false, false, false, true, false])
      Assert.assert "[36, 63] should return 36" $ unsafePartial (myButLast'' [36, 63]) == 36

  suite "The last-but-one element of a List" do
    test "List Partial: head : tail destructuring" do
      Assert.equal 3 $ unsafePartial (myButLast''' $ range 1 4)
      Assert.equal 'o' $ unsafePartial (myButLast''' ('a':'e':'i':'o':'u':Nil))
      Assert.equal true $ unsafePartial (myButLast''' (false:false:false:true:false:Nil))
      Assert.assert "Cons (36, (Cons 63, (Cons Nil))) should return 36" $ unsafePartial (myButLast''' (36:63:Nil)) == 36

  suite "The last-but-one element of an Array - safe" do
    test "reverse index" do
      Assert.equal (Just 3) $ myButLast' $ 1..4
      Assert.equal (Just 'o') $ myButLast' $ ['a', 'e', 'i', 'o', 'u']
      Assert.equal (Just true) $ myButLast' [false, false, false, true, false]
      Assert.assert "[36, 63] should return 36" $ myButLast' [36, 63] == Just 36
      Assert.assert "[42] should return Nothing" $ myButLast' [42] == Nothing

  suite "The last-but-one element of an Array - safe" do
    test "Foldable approach" do
      Assert.equal (Just 3) $ myButLast'''''' $ 1..4
      Assert.equal (Just 'o') $ myButLast'''''' $ ['a', 'e', 'i', 'o', 'u']
      Assert.equal (Just true) $ myButLast'''''' [false, false, false, true, false]
      Assert.assert "[36, 63] should return 36" $ myButLast'''''' [36, 63] == Just 36
      Assert.assert "[42] should return Nothing" $ myButLast'''''' [42] == Nothing

  


