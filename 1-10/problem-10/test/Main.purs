module Test.Main where

import Prelude

import Data.List (List(..), (:))
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Main (myEncode, myEncode', myEncode'', myEncode''', myEncode'''', myEncode''''')
import Partial.Unsafe (unsafePartial)
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "`myEncode` function on: List" do
    --  Test 1: List Char, testing with no repeating characters
    test "`takeWhile` + `dropWhile` + recursion: List Char - 1" do
      Assert.assert "('a':'b':'c':'d':'e':Nil) should have only 1 char count per list item" $ 
          myEncode ('a':'b':'c':'d':'e':Nil) == 
          (
            (1 /\ 'a') 
            : (1 /\ 'b') 
            : (1 /\ 'c') 
            : (1 /\ 'd') 
            : (1 /\ 'e') 
            : Nil
          )
        
    -- Test 2: List Char, testing default case
    test "`takeWhile` + `dropWhile` + recursion: List Char - 2" do
      Assert.assert 
        "('a':'a':'a':'a':'b':'c':'c':'a':'a':'d':'e':'e':'e':'e':Nil) should equal (4 /\\ 'a') : (1 /\\ 'b') : (2 /\\ 'c') : (2 /\\ 'a') : (1 /\\ 'd') : (4 /\\ 'e') : Nil" $ 
          myEncode ('a':'a':'a':'a':'b':'c':'c':'a':'a':'d':'e':'e':'e':'e':Nil) == 
          (4 /\ 'a') 
          : (1 /\ 'b') 
          : (2 /\ 'c') 
          : (2 /\ 'a') 
          : (1 /\ 'd') 
          : (4 /\ 'e') 
          : Nil
  
    -- Test 3: List Char, testing with single item in the List
    test "`takeWhile` + `dropWhile` + recursion: List Int - 3" do
      Assert.assert 
        "(6 : Nil) should return tuple with only one i" $ 
          myEncode (6 : Nil) == (1 /\ 6) : Nil

    -- Test 4: List Char, testing with empty List
    test "`takeWhile` + `dropWhile` + recursion: List Int - 4" do
      Assert.assert 
        "Nil should equal Nil" $ 
        myEncode (Nil :: List Int) == Nil
    
    -- Test 5: List (List Int)
    test "Recursion only: List Int - 5" do
      Assert.assert
        "((1 : 1 : 1 : 1 : Nil) : (2 : Nil) : (3 : 3 : Nil) : (1 : 1 : Nil) : (4 : Nil) : (5 : 5 : 5 : 5 : Nil) : Nil) should equal ((Tuple 4 1) : (Tuple 1 2) : (Tuple 2 3) : (Tuple 2 1) : (Tuple 1 4) : (Tuple 4 5) : Nil)" $ 
        unsafePartial $ myEncode'''''
          ((1 : 1 : 1 : 1 : Nil) 
          : (2 : Nil) 
          : (3 : 3 : Nil) 
          : (1 : 1 : Nil) 
          : (4 : Nil) 
          : (5 : 5 : 5 : 5 : Nil) 
          : Nil) 
          == (4 /\ 1) 
          : (1 /\ 2) 
          : (2 /\ 3) 
          : (2 /\ 1) 
          : (1 /\ 4) 
          : (4 /\ 5) 
          : Nil

  suite "`myEncode` function on: Array" do
    --  Test 1: Array Char, testing with no repeating characters in the array
    test "Grouping array -> Mapping subarrays to tuples with (count, head): Array Char - 1" do
      Assert.assert 
        "['a','b','c','d','e'] should have only 1 char count per array item" $
          myEncode''' ['a','b','c','d','e'] ==
          [
            (1 /\ 'a') 
            , (1 /\ 'b') 
            , (1 /\ 'c') 
            , (1 /\ 'd') 
            , (1 /\ 'e')
          ]
    
    -- Test 2: Array Char, testing default case
    test "Grouping with `myPack` and folding to tuples: Array Char - 2" do
      Assert.assert 
        "['a','a','a','a','b','c','c','a','a','d','e','e','e','e'] should equal [(4 /\\ 'a'), (1 /\\ 'b'), (2 /\\'c'), (2 /\\ 'a'), (1 /\\ 'd'), (4 /\\ 'e')]" $
          unsafePartial $ 
            myEncode' ['a','a','a','a','b','c','c','a','a','d','e','e','e','e'] ==
            [
              (4 /\ 'a') 
            , (1 /\ 'b') 
            , (2 /\ 'c') 
            , (2 /\ 'a') 
            , (1 /\ 'd') 
            , (4 /\ 'e') 
            ]
    
    -- Test 3: Array Int, testing with single item in the Array
    test "Encoding Arrays with 1 item using Arrows: Array Int - 3" do
      Assert.assert 
        "[6] should equal [(1 /\\ 6)]" $ 
          myEncode'' [6] == [(1 /\ 6)]

    -- Test 4: Array Int, testing with empty Array
    test "Grouping array -> Mapping subarrays to tuples with (count, head) with Arrows: Array Int - 4" do
      Assert.assert 
        "Nil should equal Nil" $ 
        myEncode'' ([] :: Array Int) == []

  suite "`myEncode` function on: String" do
    -- Test 1: String with repeating chars
    test "Encoding a string by mapping to array of chars, applying grouping for array of chars and zipping: String - 1" do
      Assert.assert 
        "\"aaaabccaadeeee\" should equal [4 /\\ 'a', 1 /\\ 'b', 2 /\\ 'c', 2 /\\ 'a', 1 /\\ 'd', 4 /\\ 'e']" $ 
        myEncode'''' "aaaabccaadeeee" == 
        [
          4 /\ 'a'
          , 1 /\ 'b'
          , 2 /\ 'c'
          , 2 /\ 'a'
          , 1 /\ 'd'
          , 4 /\ 'e'
        ]

    -- Test 2: String with single char
    test "Encoding a single string item: String - 2" do
      Assert.assert 
        "\"X\" should equal [\"X\"]" $ 
        myEncode'''' "X" == [(1 /\ 'X')]

    -- Test 3: Empty String
    test "Encoding an emply string: String - 4" do
      Assert.assert 
        "\"\" should equal []" $ 
        myEncode'''' "" == []
