Math ranges kata
----------------

#### Basics

An integer range can be defined in the following ways:

- Use brackets `[]` for inclusive limits
- Use parenthesis `()` for non inclusive limits
- Use curly braces `{}` for enum lists

All these examples are equivalent:

- [1, 6]
- (0, 7)
- [1, 7)
- (0, 6]
- {1, 2, 3, 4, 5, 6}

#### Proposed exercise

Implement the function `get_all_points(Range)`:

- [1, 6] → {1, 2, 3, 4, 5, 6}
- (2, 4) → {3}
- {1, 2, 3} → {1, 2, 3}
