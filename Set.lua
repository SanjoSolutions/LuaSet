local function create(list)
    local set = {}
    for _, item in ipairs(list) do
        set[item] = true
    end
    return set
end

local function size(set)
    local keys = Object.keys(set)
    return #keys
end

local function contains(set, value)
    return set[value] == true
end

local function intersect(setA, setB)
    local set = {}
    for value, _ in pairs(setA) do
        if Set.contains(setB, value) then
            set[value] = true
        end
    end
    return set
end

Set = {
    create = create,
    size = size,
    contains = contains,
    intersect = intersect
}
