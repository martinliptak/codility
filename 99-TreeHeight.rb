# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(t)
    heights = []
    heights << solution(t.l) if t.l
    heights << solution(t.r) if t.r
    
    if heights.any?
        heights.max + 1
    else
        0
    end
end