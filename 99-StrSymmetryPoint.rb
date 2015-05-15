# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(s)
    if s.length.odd?
        center = s.length / 2
        if s[0...center] == s[center + 1..s.length].reverse
            return center 
        end
    end
    -1
end