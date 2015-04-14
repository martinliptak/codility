# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a, b, k)
    first = a % k == 0 ? 1 : 0
    from = a - a % k
    rest = (b - from) / k
    first + rest
end
