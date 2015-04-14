# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    contains = {}
    for i in a
        contains[i] = true
    end
    if contains.keys.max < 1
        1
    else
        for i in (1..contains.keys.max)
            return i unless contains[i]
        end
        contains.keys.max + 1
    end
end