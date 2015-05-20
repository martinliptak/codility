# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

# doesn't work
# def solution(a)
#     return 0 if a.count == 3
#     return a.max if a.count == 4
    
#     max_slice = 0
#     max_ending = 0
#     min_value = a[0]
#     a[1..-2].each { |value|
#         if max_ending + value - min_value > 0
#             max_ending = max_ending + value - min_value
#             min_value = [min_value, value].min
#         else
#             max_ending = 0
#             min_value = value
#         end
#         max_slice = [max_slice, max_ending].max
#     }
#     max_slice
    
#     if max_slice > 0
#         max_slice
#     else
#         a[1..-2].max
#     end
# end

# incorrect for [1, 10, -100, 10, 1]
# def solution(a)
#     max_ending = 0
#     max_double_slice = 0
#     min_value = a[1]
#     (1...a.count - 1).each { |i| 
#         if max_ending + a[i] - min_value >= 0
#             max_ending = max_ending + a[i]
#             min_value = [min_value, a[i]].min
#             max_double_slice = [max_double_slice, max_ending - min_value].max
#         else
#             min_value = a[i]
#             max_ending = a[i]
#         end
#     }
#     max_double_slice
# end

# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    max_endings = [0] * a.count
    1.upto(a.count - 1) { |i| 
        max_endings[i] = [0, max_endings[i - 1] + a[i]].max
    }
    #puts max_endings.inspect
    
    max_beginnings = [0] * a.count
    (a.count - 2).downto(1).each { |i| 
        max_beginnings[i] = [0, max_beginnings[i + 1] + a[i]].max
    }
    #puts max_beginnings.inspect
    
    max_double_slice = 0
    1.upto(a.count - 2) { |i| 
        max_double_slice = [max_double_slice, max_endings[i - 1] + max_beginnings[i + 1]].max
    }
    max_double_slice
end
