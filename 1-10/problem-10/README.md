## Problem 10

### Description

Run-length encoding of an Array/List/String

**_Note:_** Use the result of Problem 9 to implement the so-called run-length encoding data compression method. Consecutive duplicates of elements are encoded as tuples (N E) where N is the number of duplicates of the element E.

### Solution Example

```purescript
> myEncode [1,1,1,2,3,3,1,1,4,5,5,5,5] == [3 /\ 1, 1 /\ 2, 2 /\ 3, 2 /\ 1, 1 /\ 4, 4 /\ 5]
> myEncode ['a','a','a','a','b','c','c','a','a','d','e','e','e','e'] == [4 /\ 'a', 1 /\ 'b', 2 /\ 'c', 2 /\ 'a', 1 /\ 'd', 4 /\ 'e']
> myEncode "aaaabccaadeeee" == [4 /\ 'a', 1 /\ 'b', 2 /\ 'c', 2 /\ 'a', 1 /\ 'd', 4 /\ 'e']
```
