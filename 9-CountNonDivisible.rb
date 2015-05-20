# O(N2)
# def solution(a)
#     result = []
#     a.each { |x| 
#         count = 0
#         a.each { |y|
#             count += 1 if x % y == 0
#         }
#         result << a.count - count
#     }
#     result
# end

# O(N2)
# def solution(a)
#     numbers = [0] * (2 * a.count + 1)
#     a.each { |x|
#         k = x
#         while k <= 2 * a.count
#             numbers[k] += 1
#             k += x
#         end
#     }
    
#     result = []
#     a.each { |x| 
#         result << a.count - numbers[x]
#     }
#     result
# end

# finally :)
def solution(a)
    counts = [0] * (2 * a.count + 1)
    a.each { |x|
        counts[x] += 1
    }
    
    divisors = [0] * (2 * a.count + 1)
    counts.each_with_index { |count, x|
        if count > 0
            k = x
            while k <= 2 * a.count
                divisors[k] += count
                k += x
            end
        end
    }
    
    result = []
    a.each { |x| 
        result << a.count - divisors[x]
    }
    result
end

#input = [3, 1, 2, 3, 6] 
input = [1] * 50_000
#input = (1..50000).to_a
puts solution(input).inspect
