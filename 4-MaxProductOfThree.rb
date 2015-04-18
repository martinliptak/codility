# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    a.sort!
    [a.last(3).inject(:*), (a.first(2) + a.last(1)).inject(:*)].max
end