# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

# incorrect and slow
# def solution(h)
#     blocks = 0
#     current = []
#     h.each do |e|
#         sum = current.any? ? current.inject(:+) : 0
#         if sum > e
#             current.each_with_index do |c, i|
#                 if e > c
#                     e -= c
#                 elsif e < c
#                     blocks += 1
#                     current[i] = e
#                     break
#                 else
#                     # use the same block
#                     current.slice!(i + 1)
#                     break
#                 end
#             end
#         elsif sum < e
#             blocks += 1
#             current.push e - sum
#         else
#             # use the same blocks
#         end
#     end
#     blocks
# end

# correct, but slow
# def solution(h)
#     blocks = 1
#     current = [h.shift]
    
#     h.each { |height| 
#         i = 0
#         while current[i] and height >= current[i]
#             height -= current[i]
#             i += 1
#         end
        
#         current.slice!(i..-1)
#         if height > 0
#             current.push height
#             blocks += 1 
#         end
#     }
    
#     blocks
# end

# correct solution
# def solution(h)
#     stack = [0] * h.count
#     num = 0
#     blocks = 0
#     h.each { |height| 
#         while num > 0 and stack[num - 1] > height
#             num -= 1
#         end
        
#         if num == 0 or stack[num - 1] != height
#             stack[num] = height
#             num += 1
#             blocks += 1
#         end
#     }
#     blocks
# end

# a nicer solution
def solution(h)
    stack = []
    blocks = 0
    h.each { |height| 
        while stack.any? and stack.last > height
            stack.pop
        end
        
        if stack.empty? or stack.last != height
            stack.push height
            blocks += 1
        end
    }
    blocks
end

# require "byebug"
# byebug

input = [8, 8, 5, 7, 9, 8, 7, 4, 8]
# input = (1..100_000).to_a
# input = (1..50_000).to_a + (1...50_000).to_a.reverse
puts solution(input)
