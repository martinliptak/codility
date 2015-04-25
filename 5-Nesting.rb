# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(s)
    size = 0
    s.each_char do |c|
        if c == "("
            size += 1
        elsif c == ")"
            size -= 1
            return 0 if size < 0
        end
    end
    return 0 if size > 0
    return 1
end