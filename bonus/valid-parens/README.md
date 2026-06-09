## Valid Parenthesis

This bonus coding challenge is based on LeetCode Challenge [#20: Valid Parentheses](https://leetcode.com/problems/valid-parentheses/description/)

### Description

Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Every close bracket has a corresponding open bracket of the same type.

#### Example 1:

_Input:_ `s = "()"` \
_Output:_ `true`

#### Example 2:

_Input:_ `s = "()[]{}"` \
_Output:_ `true`

#### Example 3:

_Input:_ `s = "(]"` \
_Output:_ `false`

#### Example 4:

_Input:_ `s = "([])"` \
_Output:_ `true`

#### Example 5:

_Input:_ `s = "([)]"` \
_Output:_ `false`

#### Constraints:

`1 <= s.length <= 104`
`s` consists of parentheses only `'()[]{}'`.

```purescript
isValidParens :: String -> Boolean
```
