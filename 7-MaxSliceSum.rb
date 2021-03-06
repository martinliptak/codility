# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    max_ending = 0
    max_slice = 0
    
    a.each { |v|
        max_ending = [0, max_ending + v].max
        max_slice = [max_slice, max_ending].max
    }
    
    if max_slice > 0
        max_slice
    else
        a.max
    end
end
