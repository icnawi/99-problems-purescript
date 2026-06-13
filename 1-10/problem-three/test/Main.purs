module Test.Main where

import Prelude

import Data.List (List(..), (:))
import Effect (Effect)
import Main (elementAt', elementAt'''', elementAt''''')
import Partial.Unsafe (unsafePartial)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "Element search at index of a list" do
    test "From single element to many" do
      Assert.equal 'J' $ elementAt' ('d':'v':'J':'o':'K':Nil) 3
      Assert.assert "(36 : 63) at 2 should return 63" $ elementAt' (36:63:Nil) 2 == 63
      Assert.assert "(36 : Nil) at 2 should return 63" $ elementAt' (36:Nil) 1 == 36

  suite "Element search at index of a array" do
    test "Singles and many" do
      Assert.equal 'J' $ unsafePartial $ elementAt''''' ['d','v','J','o','K'] 3
      Assert.assert "[36, 63] at 2 should return 63" $ unsafePartial $ elementAt''''' [36, 63] 2 == 63
      Assert.assert "[36] at 1 should return 36" $ unsafePartial $ elementAt''''' [36] 1 == 36

  suite "Element search at index of a String" do
    test "From single element to many" do
      Assert.equal 'r' $ elementAt'''' "PureScript" 3
      Assert.assert "`Yo` at 2 should return `o`" $ elementAt'''' "Yo" 2 == 'o'
      Assert.assert "`K` at 1 should return `K`" $ elementAt'''' "K" 1 == 'K'


