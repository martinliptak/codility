# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

# doesn't work
def solution(a)
    return 0 if a.count == 3
    return a.max if a.count == 4
    
    max_slice = 0
    max_ending = 0
    min_value = a[0]
    a[1..-2].each { |value|
        if max_ending + value - min_value > 0
            max_ending = max_ending + value - min_value
            min_value = [min_value, value].min
        else
            max_ending = 0
            min_value = value
        end
        max_slice = [max_slice, max_ending].max
    }
    max_slice
    
    if max_slice > 0
        max_slice
    else
        a[1..-2].max
    end
end
