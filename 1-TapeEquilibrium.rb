# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    first = 0
    second = a.inject(:+)
    (1..a.count - 1).map do |p|
        first += a[p - 1]
        second -= a[p - 1]
        (first - second).abs
    end.min
end
