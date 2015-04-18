# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

# O(N) using hash
def solution(a)
    a.uniq.count 
end

# O(N log N) using sort
# def solution(a)
#     return 0 if a.count == 0
    
#     a.sort!
    
#     distinct = 1
#     for i in (1...a.count)
#         distinct += 1 if a[i] != a[i - 1]
#     end
#     distinct
# end