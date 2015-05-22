# incorrect
# def solution(a, b)
#     return 0 if a.none?
#     return 1 if a.count == 1

#     count = 0
#     start = a.last
#     (b.count - 1).downto(0) { |i|
#         if b[i] < start
#             start = a[i]
#             if count > 0
#                 count += 1
#             else
#                 count += 2
#             end
#         end
#     }
#     count
# end

def solution(a, b)
    return 0 if a.none?
    return 1 if a.count == 1

    count = 1
    prev_end = b.first
    for i in (1...a.count)
        if a[i] > prev_end
            prev_end = b[i]
            count += 1
        end
    end
    count
end

require "minitest/autorun"
require "byebug"
require "timeout"

# byebug
# solution(nil)
# exit

class TestSolution < Minitest::Test
    def test_default
        assert_equal 3, solution([1, 3, 7, 9, 9], [5, 6, 8, 9, 10])
        assert_equal 4, solution([1, 3, 7, 9, 9], [2, 6, 8, 9, 10])
    end

    def test_simple_1
        assert_equal 1, solution([1], [2])
        assert_equal 0, solution([1, 2], [2, 3])
        assert_equal 2, solution([1, 3], [2, 4])
        assert_equal 3, solution([1, 3, 5], [2, 4, 6])
    end

    def test_simple_2
        assert_equal 3, solution([1, 3, 5, 1], [2, 4, 6, 10])
    end

    def test_small
        assert_equal 0, solution([], [])
    end

    def test_large
        Timeout::timeout(6) {
            assert_equal 0, solution([1] * 30_000, [2] * 30_000)
        }
    end
end
