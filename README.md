# P-99: Ninety-Nine PureScript Problems and Solutions

## Problems 1 to 10

### P1

**Description:** Find the last element of the array/linked list \
**_Example:_** \
\

```purescript
myLast [1,2,3,4] == 4
myLast ['x','y','z'] == 'z'
```

### P2

**Description:** Find the last-but-one (or second-last) element of a array/list. \
**_Example:_** \
\

```purescript
myButLast [1,2,3,4] == 3
myLast ['a'..'z'] == 'y'
```

### P3

**Description:** Find the K-th element of a array/list. \
**_Example:_** \
\

```purescript
elementAt ('a':'b':'c':'d':'e':Nil) == c -- Considering the fst elem as 1
```

### P4

**Description:** Find the number of elements in an array/list/string/chars. \
**_Example:_** \
\

```purescript
myLength [123, 456, 789] == 3
myLength "Hello, world!" == 13
```

### P5

**Description:** Reverse an array/list. \
**_Example:_** \
\

```purescript
myReverse "A man, a plan, a canal, panama!" == "!amanap ,lanac a ,nalp a ,nam A"
myReverse [1,2,3,4] == [4,3,2,1]
myReverse ('a':'b':'c':'d':'e':Nil) == ('e','d','c','b','a':Nil)
```

### P6

**Description:** Find out whether an array/list is a palindrome. \
**_Example:_** \
\

```purescript
isPalindrome [1,2,3]              == false
isPalindrome "madamimadam"        == true
isPalindrome [1,2,4,8,16,8,4,2,1] == true
```

### P7

**Description:** Flatten a nested array/list structure. \
_**Note:** Transform a list, possibly holding lists as elements into a `flat` list by replacing each list with its elements (recursively)._ \
**_Example:_** \
\

```purescript
myFlatten (1:(2:(3:4):5:Nil)) == (1:2:3:4:5:Nil)
```

### P8

**Description:** Eliminate consecutive duplicates of array/list elements. \
_**Note:** If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed._ \
**_Example:_** \
\

```purescript
myCompress 1 [1,1,1,2,3,3,1,1,4,5,5,5,5] == [1, 2, 3, 1, 4, 5]
```

### P9

**Description:** Pack consecutive duplicates of array/list elements into sublists. \
_**Note:** If a list contains repeated elements they should be placed in separate sublists/strings._ \
**_Example:_** \
\

```purescript
myPack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'] == [['a','a','a','a'],['b'],['c','c'],['a','a'],['d'],['e','e','e','e']]
-- OR
myPack ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e'] == ["aaaa","b","cc","aa","d","eeee"]
```

### P10

**Description:** Run-length encoding of an array/list. \
_**Note:** Use the result of Problem 9 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as lists (N E) where N is the number of duplicates of the element E._ \
**_Example:_** \
\

```purescript
myEncode "aaaabccaadeeee" = [4/\'a', 1/\'b', 2/\'c', 2/\'a', 1/\'d', 4/\'e']
```

- Problems 11 to 20: Lists, continued -- to be added...
- Problems 21 to 28: Lists again -- to be added...
- Problems 31 to 41: Arithmetic -- to be added...
- Problems 46 to 50: Logic and codes -- to be added...
- Problems 54A to 60: Binary trees -- to be added...
- Problems 61 to 69: Binary trees, continued -- to be added...
- Problems 70B to 73: Multiway trees -- to be added...
- Problems 80 to 89: Graphs -- to be added...
- Problems 90 to 94: Miscellaneous problems -- to be added...
- Problems 95 to 99: Miscellaneous problems, continued -- to be added...
