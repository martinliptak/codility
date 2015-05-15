# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    missing = 0
    a.each { |v|
        missing ^= v
    }
    missing
end
