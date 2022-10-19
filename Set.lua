local function create(list)
    local set = {}
    if list then
        for _, item in ipairs(list) do
            set[item] = true
        end
    end
    return set
end

local function copy(set)
    local setCopy = {}
    for key, value in pairs(set) do
        setCopy[key] = value
    end
    return setCopy
end

local function iterator(set)
    return pairs(set)
end

local function toList(set)
    local list = {}
    for value, _ in pairs(set) do
        table.insert(list, value)
    end
    return list
end

local function size(set)
    local keys = Object2.keys(set)
    return #keys
end

local function contains(set, value)
    return set[value] == true
end

local function intersect(...)
    local sets = {...}
    local set

    if #sets >= 1 then
        set = copy(sets[1])
        for index = 2, #sets do
            local setB = sets[index]
            for key, _ in pairs(set) do
                if set[key] and not setB[key] then
                    set[key] = nil
                end
            end
        end
    else
        set = {}
    end

    return set
end

local function equals(setA, setB)
    local setASize = size(setA)
    local setBSize = size(setB)
    return setASize == setBSize and Set.size(intersect(setA, setB)) == setASize
end

Set = {
    create = create,
    copy = copy,
    iterator = iterator,
    toList = toList,
    size = size,
    contains = contains,
    intersect = intersect,
    equals = equals,
}
