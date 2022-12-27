Set = {}

function Set:new(list)
  return Set.create(list)
end

function Set.create(list)
  local set = {}
  setmetatable(set, {__index = Set})
  if list then
    for _, item in ipairs(list) do
      Set.add(set, item)
    end
  end
  return set
end

function Set:add(element)
  self[element] = true
end

function Set:copy()
  local setCopy = {}
  for key, value in pairs(self) do
    setCopy[key] = value
  end
  return setCopy
end

function Set:iterator()
  return pairs(self)
end

function Set:toList()
  local list = {}
  for value, _ in pairs(self) do
    table.insert(list, value)
  end
  return list
end

function Set:size()
  local keys = Object2.keys(self)
  return #keys
end

function Set:contains(value)
  return self[value] == true
end

function Set:containsWhichFulfillsCondition(condition)
  for element in Set.iterator(self) do
    if condition(element) then
      return true
    end
  end
  return false
end

function Set:remove(element)
  self[element] = nil
end

function Set:intersect(...)
  local sets = { self, ... }
  local set

  if #sets >= 1 then
    set = Set.copy(sets[1])
    for index = 2, #sets do
      local setB = sets[index]
      for key, _ in pairs(set) do
        if set[key] and not setB[key] then
          Set.remove(set, key)
        end
      end
    end
  else
    set = {}
  end

  return set
end

function Set:equals(setB)
  local setASize = Set.size(self)
  local setBSize = Set.size(setB)
  return setASize == setBSize and Set.size(Set.intersect(self, setB)) == setASize
end

function Set:union(...)
  -- FIXME: Return Set
  return Object.assign({}, self, ...)
end

function Set:hasElements()
  return Boolean.toBoolean(next(self))
end

function Set:isEmpty()
  return not Set.hasElements(self)
end
