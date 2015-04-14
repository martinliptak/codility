# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    min_val = 10_000
    min_pos = 0
    
    sums = [0]
    for i in (0..a.count - 1) 
        sums << sums.last + a[i] 
    end
    for p in (0..a.count - 2)
        for q in (p + 1..[p + 2, a.count - 1].min)
            s = (sums[q + 1] - sums[p]).to_f / (q - p + 1)
            if s < min_val
                min_val = s
                min_pos = p
            end
        end
    end
    min_pos
end

# ugly