## Problem 8

### Description

Eliminate consecutive duplicates of Array/List elements.

**_Note:_** If a list contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

### Solution Example

```purescript
> myCompress [1,1,1,2,3,3,1,1,4,5,5,5,5] == [1, 2, 3, 1, 4, 5]
> myCompress ['a','a','a','a','b','c','c','a','a','d','e','e','e','e'] == ['a', 'b', 'c', 'a', 'd', 'e']
> myCompress "aaaabccaadeeee" == "abcade"
```
