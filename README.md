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

## Usage

### Embedding

#### Introduction

With this approach, the library is included as part of the add-on. A benefit to the add-on user is, that only
the add-on appears in the add-on list. So it can be easier to enable or disable an add-on and its library dependencies
compared to an approach where the libraries are included as add-ons (in this case each library shows as an add-on in the add-ons list and the user potentially is required to tick multiple checkboxes to enable or disable an add-on and its library dependencies).

#### How to do it

This library registers itself via the library "[Library](https://github.com/SanjoSolutions/LuaLibrary)". With this approach it is avoided to create another global (with its theoretical potential that other add-ons already use the same global). And "Library" also handles when multiple add-ons load the same library, potentially different versions of it.
To embed it, also include "[Library](https://github.com/SanjoSolutions/LuaLibrary)" as a dependency to your add-on.

In our example, we have installed both "Library", "Set" and the dependencies of "Set" ("Boolean" and "Object") inside the "libs" folder inside the add-on folder.

In your add-ons TOC file add (to load "Library" and "Set" and its dependencies):

```
libs/Library/Library.xml
libs/Boolean/Boolean.xml
libs/Object/Object.xml
libs/Set/Set.xml
```

It's recommended to load the library files first, so that the libraries are available in the other Lua files.

In your Lua file(s), you can access the library via:

```lua
local Set = Library.retrieve('Set', '^1.0.0')
```

### As add-on

This library can also just be put directly in the AddOns folder. In this case the library is available via the global `Set`.

If you develop an add-on and do this approach, you can just include this library in your release as a folder next to your add-ons folder.
