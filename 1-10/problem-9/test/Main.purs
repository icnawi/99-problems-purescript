module Test.Main where

import Prelude

import Data.List (List(..), (:))
import Effect (Effect)
import Main (myPack, myPack', myPack'')
import Test.Unit (suite, test)
import Test.Unit.Assert as Assert
import Test.Unit.Main (runTest)

main :: Effect Unit
main = runTest do
  suite "`myPack` function on: List" do
  --  Test 1: List Char, testing with no repeating characters
    test "`span` + recursion: List Char - 1" do
      Assert.assert 
        "('a':'b':'c':'d':'e':Nil) should equal ('a' : Nil) : ('b' : Nil) : ('c' : Nil) : ('d' : Nil) : ('e' : Nil) : Nil" $ 
          myPack ('a':'b':'c':'d':'e':Nil) == 
          ('a' : Nil) 
          : ('b' : Nil) 
          : ('c' : Nil) 
          : ('d' : Nil) 
          : ('e' : Nil) 
          : Nil
  
  -- Test 2: List Char, testing default case
    test "`span` + recursion: List Char - 2" do
      Assert.assert 
        "('a':'a':'a':'a':'b':'c':'c':'a':'a':'d':'e':'e':'e':'e':Nil) should equal ('a' : 'a' : 'a' : 'a' : Nil) : ('b' : Nil) : ('c':'c': Nil) : ('a' : 'a' : Nil) : ('d' : Nil) : ('e' : 'e' : 'e' : 'e' : Nil) : Nil" $ 
          myPack ('a':'a':'a':'a':'b':'c':'c':'a':'a':'d':'e':'e':'e':'e':Nil) == 
          ('a' : 'a' : 'a' : 'a' : Nil) 
          : ('b' : Nil) 
          : ('c':'c': Nil) 
          : ('a' : 'a' : Nil) 
          : ('d' : Nil) 
          : ('e' : 'e' : 'e' : 'e' : Nil) 
          : Nil
  
  -- Test 3: List Int, testing with single item in the List
    test "`span` + recursion: List Int - 3" do
      Assert.assert 
        "(6 : Nil) should equal ((6 : Nil) : Nil)" $ 
          myPack (6 : Nil) == (6 : Nil) : Nil

  -- Test 4: List Int, testing with empty List
    test "`span` + recursion: List Int - 4" do
      Assert.assert "Nil should equal Nil" $ myPack (Nil :: List Int) == Nil

  suite "`myPack` function on: Array" do
    --  Test 1: Array Char, testing with no repeating characters
    test "`span` + recursion: Array Char - 1" do
      Assert.assert 
        "['a','b','c','d','e'] should equal [ ['a'], ['b'], ['c'], ['d'], ['e']]" $
          myPack' ['a','b','c','d','e'] ==
          [
            ['a']
            , ['b']
            , ['c']
            , ['d']
            , ['e']
          ]
    
    -- Test 2: Array Char, testing default case
    test "`span` + recursion: Array Char - 2" do
      Assert.assert 
        "['a','a','a','a','b','c','c','a','a','d','e','e','e','e'] should equal [ ['a','a','a','a'], ['b'], ['c','c'], ['a','a'], ['d'], ['e','e','e','e']]" $
          myPack' ['a','a','a','a','b','c','c','a','a','d','e','e','e','e'] ==
          [
            ['a','a','a','a']
            , ['b']
            , ['c','c']
            , ['a','a']
            , ['d']
            , ['e','e','e','e']
          ]
    
    -- Test 3: Array Int, testing with single item in the Array
    test "`span` + recursion: Array Int - 3" do
      Assert.assert 
        "[6] should equal [[6]]" $ 
          myPack' [6] == [[6]]

    -- Test 4: Array Int, testing with empty Array
    test "`span` + recursion: Array Int - 4" do
      Assert.assert "Nil should equal Nil" $ myPack' ([] :: Array Int) == []

  suite "`myPack` function on: Array" do
    -- Test 1: String with repeating chars
    test "`map` + `span` + recursion: String - 1" do
      Assert.assert "\"aaaabccaadeeee\" should equal [\"aaaa\", \"b\", \"cc\", \"aa\", \"d\", \"eeee\"]" $ myPack'' "aaaabccaadeeee" == ["aaaa", "b", "cc", "aa", "d", "eeee"]
    
    -- Test 2: String with NO repeating chars
    test "`map` + `span` + recursion: String - 2" do
      Assert.assert "\"PureScript\" should equal [\"P\",\"u\",\"r\",\"e\",\"S\",\"c\",\"r\",\"i\",\"p\",\"t\"]" $ myPack'' "PureScript" == ["P","u","r","e","S","c","r","i","p","t"]
    
    -- Test 3: String with single char
    test "`map` + `span` + recursion: String - 3" do
      Assert.assert "\"X\" should equal [\"X\"]" $ myPack'' "X" == ["X"]

    -- Test 4: Empty String
    test "`map` + `span` + recursion: String - 4" do
      Assert.assert "\"\" should equal []" $ myPack'' "" == []