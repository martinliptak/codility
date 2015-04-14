# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(x, a)
    leaves = {}
    path = 0
    for i in (0..a.count - 1)
        leaf = a[i]
        if leaf <= x
            unless leaves[leaf]
                path += 1 
                return i if path == x
            end
            leaves[leaf] = true
        end
    end
    return -1
end
