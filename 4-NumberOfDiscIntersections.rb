# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

# first naive solution
# def solution(a)
#     intersecting = 0
#     for i in (0...a.count)
#         for j in (i + 1...a.count)
#             if i + a[i] >= j - a[j] 
#                 intersecting += 1
#             end
#             return -1 if intersecting > 10_000_000
#         end
#     end
#     intersecting
# end

# doesn't pass the performance test either :)
def solution(a)
    from = (0...a.count).map do |i|
        [i - a[i], i + a[i]]
    end.sort_by do |e|
        e.first
    end
    
    intersecting = 0
    for i in (0...from.count)
        for j in (i + 1...from.count)
            if from[i].last >= from[j].first 
                intersecting += 1
                return -1 if intersecting > 10_000_000
            else
                break # an optimization, but apparently still O(2)
            end
        end
    end
    intersecting
end

# correct solution :)
# https://github.com/jsuchal/codility/blob/master/beta2010.rb