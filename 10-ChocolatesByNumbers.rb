# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(n, m)
    n / gcd(n, m)
end

def gcd(a, b)
    if a % b == 0
        b
    else
        gcd(b, a % b)
    end
end