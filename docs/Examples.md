---
sidebar_position: 3
---

Sift contains a number of useful functions for working with data structures. These functions are available as static methods on the Sift module (refer to the [API documentation](/api) for more details).

```lua
local Sift = require(path.to.Sift)
```

Sift also exports Luau types, which can be accessed from the Sift module itself, or via the dedicated Types module, which is exported as `Sift.Types`.

### Combining Data

```lua
local dictionary1 = { a = 1, b = 2 }
local dictionary2 = { c = 3, d = 4 }

local result = Sift.Dictionary.merge(dictionary1, dictionary2) -- { a = 1, b = 2, c = 3, d = 4 }
```

```lua
local array1 = { 1, 2, 3 }
local array2 = { 4, 5, 6 }

local result = Sift.Array.concat(array1, array2) -- { 1, 2, 3, 4, 5, 6 }
```

### Filtering Data

The following example filters out all uneven numbers from an array of numbers.

```lua
local array = { 1, 2, 3, 4, 5, 6 }

local result = Sift.Array.filter(array, function(value)
  return value % 2 == 0
end) -- { 2, 4, 6 }
```

Dictionaries can also be filtered in Sift!

```lua
local dictionary = { a = 1, b = 2, c = 3, d = 4 }

local result = Sift.Dictionary.filter(dictionary, function(value)
  return value % 2 == 0
end) -- { b = 2, d = 4 }
```

### Removing Duplicates

There's a few different methods for removing duplicates from an array or dictionary.

The following example removes all duplicate values from an array using sets.

```lua
local array = { "hello", "world", "world", "cat", "dog" }

local set = Sift.Set.fromArray(array) -- { "hello" = true, "world" = true, "cat" = true, "dog" = true }

local result = Sift.Set.toArray(set) -- { "hello", "world", "cat", "dog" }
```

The same could also be accomplished using a reducer.

```lua
local array = { "hello", "world", "world", "cat", "dog" }

local result = Sift.Array.reduce(array, function(accumulator, value)
  if not Sift.Array.includes(accumulator, value) then
    return Sift.Array.push(accumulator, value)
  end

  return accumulator
end, {}) -- { "hello", "world", "cat", "dog" }
```
