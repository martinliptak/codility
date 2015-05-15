# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(k, a)
    count = 0
    current = 0
    a.each { |length| 
        current += length
        if current >= k
            current = 0
            count += 1
        end
    }
    count
end
