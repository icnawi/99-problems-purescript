module Test.Main where

import Prelude

import Effect (Effect)
import Parens (isValidParens)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "Shallow grouping symbols" do
    test "4 types of paired grouping sympbols: () {} [] <> should be valid" do
      Assert.equal true $ isValidParens "(){}[]<>"
    test "Parenthesis a + Square Brackets b shouldn't be valid" do
      Assert.equal false $ isValidParens "(]"

  suite "Nested grouping symbols" do
    test "1-Level nested and paired grouping symbols => ([]) should be valid" do
      Assert.equal true $ isValidParens "([])"
    test "1-Level nested and paired grouping symbols => ([)]  shouldn't be valid" do
      Assert.equal false $ isValidParens "([)]"
    test "2-Level nested and paired grouping symbols => ([<>]) should be valid" do
      Assert.equal true $ isValidParens "([<>])"
    test "2-Level nested and paired grouping symbols => ([<)]> shouldn't be valid" do
      Assert.equal false $ isValidParens "([<)]>"

  suite "Content inside grouping symbols" do
    test "Grouping sympbols matching shouldn't be valid with content inside" do 
      Assert.equal false $ isValidParens "[hello]"
