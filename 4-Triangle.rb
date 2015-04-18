# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    return 0 if a.count < 3
    
    a.sort!
    for i in (2...a.count)
        x = a[i - 2]
        y = a[i - 1]
        z = a[i]
        
        return 1 if x + y > z && x + z > y && z + y > x
    end
    
    return 0
end

# more ruby way :)
# def solution(a)
#     if a.sort.each_cons(3).any? { |t| t[0] + t[1] > t[2] }
#         1
#     else
#         0
#     end
# end