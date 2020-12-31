local function create(list)
    local set = {}
    for _, item in ipairs(list) do
        set[item] = true
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

local function size(set)
    local keys = Object.keys(set)
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

Set = {
    create = create,
    copy = copy,
    size = size,
    contains = contains,
    intersect = intersect
}
