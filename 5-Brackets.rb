# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(s)
    stack = []
    s.each_char do |c|
        if ["{", "[", "("].include?(c)
            stack.push(c)
        elsif c == "}"
            return 0 if stack.pop != "{"
        elsif c == "]"
            return 0 if stack.pop != "["
        elsif c == ")"
            return 0 if stack.pop != "("
        end
    end
    return 0 if stack.any?
    return 1
end
