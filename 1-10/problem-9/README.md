## Problem 9

### Description

Pack consecutive duplicates of Array/List/String elements into subarrays/sublists/string.

**_Note:_** If a array/list/string contains repeated elements they should be replaced with a single copy of the element. The order of the elements should not be changed.

### Solution Example

```purescript
> myPack [1,1,1,2,3,3,1,1,4,5,5,5,5] == [[1,1,1], [2], [3], [1], [4], [5]]
> myPack ['a','a','a','a','b','c','c','a','a','d','e','e','e','e'] == [['a','a','a','a'], ['b'], ['c', 'c'], ['a', 'a'], ['d'], ['e','e','e','e']]
> myPack "aaaabccaadeeee" == ["aaaa", "b", "cc", "aa", "d", "eeee"]
```
