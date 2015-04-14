# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    counts = {}
    for i in a
        counts[i] ||= 0
        counts[i] += 1
    end
    for i in (1..a.count)
        return 0 if counts[i] != 1
    end
    return 1
end
