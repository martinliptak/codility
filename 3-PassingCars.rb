# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    east = 0
    west = 0
    passing = 0
    for i in a
        case i
            when 0
                east += 1
            when 1
                west += 1
                passing += east
        end
        return -1 if passing > 1_000_000_000
    end
    passing
end
