# Lua Set

This work is devoted to God.

A library for working with sets. This library can save add-on developers some work.

## Things included

* Set.new: a constructor for creating a new set.
* Set.create: a function for creating a set. Functionally the same as Set.new.

The following functions / methods can be called in two ways:

* When a set has been created with Set.new or Set.create then "add" for example can be called like this:

```lua
local set = Set.create()
set:add(1)
```

* Or by passing the set as first argument.

```lua
local set = Set.create()
set.add(set, 1)
```

This method also works for tables which fit the structure of set tables (just called set in other places in this documentation).

**Functions / Methods:**

* **add**: adds an element to the set.
* **copy**: copies a set.
* **iterator**: creates an iterator for the set.
* **toList**: creates a list out of the set.
* **size**: returns the number of elements in the set.
* **contains**: checks if the set contains a value.
* **containsWhichFulfillsCondition**: checks if the set contains an element which fulfills specific conditions.
* **remove**: removes an element from the set.
* **intersect**: creates an intersection of multiple sets.
* **equals**: checks if two sets are equal.
* **union**: creates a union of a set.
* **hasElements**: checks if a set has any elements.
* **isEmpty**: checks if a set is empty.

## How to use

Please see "[How to use Library](https://github.com/SanjoSolutions/LuaLibrary#how-to-use)" for how to use this library.
