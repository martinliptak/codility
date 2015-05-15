# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(k, m, a)
    sums = [0] * (a.count + 1)
    a.count.times { |i|
        sums[i + 1] = sums[i] + a[i]
    }
    puts sums.inspect
    
    
end
