## Problem 7

### Description

Transform a array/list, possibly holding arrays/lists as elements into a `flat` array/list by replacing each array/list with its elements (recursively).

### Solution Example

```purescript
> myFlatten (1:(2:(3:4:Nil):5:Nil):Nil) == (1:2:3:4:5:Nil)
> myFlatten [1,[2,[3,4],5]] == [1,2,3,4,5]
> myFlatten ['H', ['e', ['l', 'l'],'o']] == "Hello"
```
