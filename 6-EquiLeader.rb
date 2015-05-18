# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    stack_top = nil
    stack_size = 0
    a.each { |v| 
        if stack_size == 0
            stack_top = v
            stack_size += 1
        else
            if stack_top == v
                stack_size += 1
            else
                stack_size -= 1
            end
        end
    }
    candidate = stack_top
    
    equi_leaders = 0
    if stack_size > 0
        total_candidates = a.count { |v| v == candidate }
        count_candidates = 0
        a.each_with_index { |v, i|
            count_candidates += 1 if v == candidate
            if count_candidates > (i + 1) / 2
                equi_leaders += 1 if (total_candidates - count_candidates) > (a.count - i - 1) / 2
            end
        }
    end
    equi_leaders
end
