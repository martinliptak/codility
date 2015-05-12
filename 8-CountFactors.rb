# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(n)
    return 1 if n == 1
    
    factors = 2
    limit = Math.sqrt(n).floor
    if limit * limit == n
        factors += 1 
        limit -= 1
    end
    
    (2..limit).each { |number|
        factors += 2 if n % number == 0
    }

    factors
end