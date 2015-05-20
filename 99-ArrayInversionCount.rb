# def solution(a)
#     inversions = 0
#     a.each_with_index { |x, i| 
#         a.each_with_index { |y, j|
#             inversions += 1 if i < j && x > y
#         }
#     }
#     inversions
# end

# incorrect
def solution(a)
    a_with_indexes = []
    a.each_with_index { |v, i| 
        a_with_indexes << [v, i] 
    }
    a_with_indexes.sort!

    inversions = 0
    a_with_indexes.each_with_index { |v, i| 
        inversions += v[1] - i if v[1] > i
    }
    inversions
end

require "minitest/autorun"
require "byebug"
require "timeout"

class TestSolution < Minitest::Test
    def test_default
        input = [-1, 6, 3, 4, 7, 4] 
        output = 4
        assert_equal output, solution(input)
    end

    def test_sorted
        input = [-1, 0, 1, 2, 3, 4] 
        output = 0
        assert_equal output, solution(input)
    end

    def test_not_sorted
        input = [4, 1, 0, 3, 2, -1] 
        output = 11
        assert_equal output, solution(input)
    end

    def test_empty
        input = [] 
        output = 0
        assert_equal output, solution(input)
    end

    def test_large
        input = [1] * 100_000 
        output = 0
        Timeout::timeout(6) {
            assert_equal output, solution(input)
        }
    end
end
