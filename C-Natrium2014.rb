# slow
# def solution(a)
#     beginnings = []
#     max = 0
#     min = nil
#     a.each_with_index { |v, i| 
#         if not min or v < min
#             min = v
#             beginnings << [v, i]
#         else
#             beginnings.each { |b| 
#                 break if i - b[1] <= max
#                 if v >= b[0]
#                     max = i - b[1]
#                     break
#                 end
#             }
#         end
#     }
#     max
# end

# slow :)
# def solution(a)
#     distance = 0
#     a.each_with_index { |x, p| 
#         a.each_with_index { |y, q| 
#             if p <= q && x <= y
#                 distance = [distance, q - p].max
#             end
#         }
#     }
#     distance
# end

def solution(a)
    candidates = []
    a.each_with_index { |v, i| 
        if candidates.none? or v < candidates.last[0]
            candidates << [v, i]
        end
    }

    max = 0
    (a.count - 1).downto(0) { |i|
        while candidates.any? and a[i] >= candidates.last[0]
            max = [max, i - candidates.last[1]].max
            candidates.pop # O(N) because of this
        end
    }
    max
end

require "minitest/autorun"
require "byebug"
require "timeout"

# byebug
# solution(nil)
# exit

class TestSolution < Minitest::Test
    def test_default
        assert_equal 3, solution([5, 3, 6, 3, 4, 2] )
    end

    def test_simple
        assert_equal 1, solution([1, 2])
        assert_equal 2, solution([1, 2, 3])
        assert_equal 3, solution([1, 2, 3, 4])

        assert_equal 2, solution([1, 1, 2])
        assert_equal 3, solution([1, 2, 2, 3])
        assert_equal 4, solution([1, 2, 3, 3, 4])      

        assert_equal 2, solution([1, 2, 1])
        assert_equal 3, solution([1, 2, 3, 2])
        assert_equal 5, solution([1, 2, 3, 4, 3, 5])  

        assert_equal 4, solution([1, 2, 3, 0, 4])
        assert_equal 3, solution([1, 2, 3, 4, 0])

        assert_equal 4, solution([7, 6, 1, 2, 3, 0, 4])
        assert_equal 6, solution([1, 2, 3, 0, -5, -1, -1, -2, -3, -4, -5])
        assert_equal 5, solution([1, 2, 3, 0, -5, -4, -3, -2, -2, -1])
    end

    def test_negative
        assert_equal 2, solution([-3, -2, -1])
        assert_equal 0, solution([-1, -2, -3])
    end

    def test_small
        assert_equal 0, solution([1])
    end

    def test_large
        Timeout::timeout(6) {
            assert_equal 299_999, solution((1..300_000).to_a)
        }
        Timeout::timeout(6) {
            assert_equal 0, solution((1..300_000).to_a.reverse)
        }
        Timeout::timeout(6) {
            assert_equal 299_999, solution([1] * 300_000)
        }
        Timeout::timeout(6) {
            solution((1..300_000).to_a.shuffle)
        }
    end
end
