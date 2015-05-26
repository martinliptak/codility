# First attempt :)
# def solution(a)
#     a.sort!

#     back = 0
#     front = a.count - 1
#     result = (a[back] + a[front]).abs
#     while (back <= front)
#         moves = []
#         moves << [(a[back + 1] + a[front]).abs, :back] if a[back + 1]
#         moves << [(a[back] + a[front - 1]).abs, :front] if a[front - 1]
#         moves << [(a[back + 1] + a[front - 1]).abs, :both] if a[back + 1] && a[front - 1]
#         moves << [result, :none]
#         best = moves.min
        
#         result = best[0]

#         case best[1]
#         when :back
#             back += 1
#         when :front
#             front -= 1
#         when :both
#             back += 1
#             front -= 1
#         else
#             break
#         end
#     end
#     result
# end

def solution(a)
    a.sort!

    # optimizations for non-negative and non-positive sequences

    back = 0
    front = a.count - 1
    result = (a[front] + a[front]).abs
    while (back <= front)
        current = (a[back] + a[front]).abs

        result = [result, current].min

        if a[back + 1] && (a[back + 1] + a[front]).abs <= current
            back += 1
        elsif a[front - 1] && (a[back] + a[front - 1]).abs <= current
            front -= 1
        else
            back += 1
            front -= 1
        end
    end
    result
end

# One more solution
#
# def solution(a)
#     a.sort!

#     result = (a[0] + a[0]).abs
#     for i in (0...a.count)
#         result = [result, binary_search(a, i)].min
#     end
#     result
# end

# def binary_search(a, i)
#     from = 0
#     to = a.count
#     current = nil
#     while from <= to
#         mid = (from + to) / 2
#         current = (a[i] + a[mid]).abs
#         if mid + 1 < a.count && (a[i] + a[mid + 1]).abs < current
#             from = mid + 1
#         elsif mid - 1 >= 0 && (a[i] + a[mid - 1]).abs < current
#             to = mid - 1
#         else
#             break
#         end
#     end
#     current
# end

require "minitest/autorun"
require "byebug"
require "timeout"

# byebug
# solution([1, 4, -3])
# exit

class TestSolution < Minitest::Test
    def test_default
        assert_equal 1, solution([1, 4, -3])
        assert_equal 3, solution([-8, 4, 5, -10, 3])
    end

    def test_simple_1
        assert_equal 2, solution([1, 2, 3])
        assert_equal 2, solution([-1, -2, -3])
        assert_equal 1, solution([-3, -1, 2, 4, 6])
        assert_equal 1, solution([-3, -1, 2, 2, 2, 4, 6])
    end

    def test_simple_2
        assert_equal 0, solution([-8, -1, 1, 6])
        assert_equal 1, solution([-8, -3, -1, 2, 2, 2, 4, 6])
    end

    def test_simple_3
        assert_equal 2, solution([-3, 1, 10])
    end

    def test_small
        assert_equal 6, solution([3])
    end

    def test_large
        Timeout::timeout(6) {
            assert_equal 2, solution([1] * 100_000 )
        }
    end
end
