# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a, b)
    dead = 0
    stack = []
    b.each_with_index do |_, i|
        direction = b[i]
        size = a[i]
        case direction
            when 0
                while stack.last
                    dead += 1
                    if size > stack.last
                        stack.pop
                    else
                        break
                    end
                end
            when 1
                stack.push size
        end
    end
    a.count - dead
end
