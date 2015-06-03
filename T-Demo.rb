# incorrect, read carefully
def solution(a)
    sum = a.inject(:+)
    left = 0

    return -1 if a.count == 0
    return 0 if a.count == 1

    return 0 if left == sum
    
    (0...a.count - 1).each { |i| 
        left += a[i]
        return i + 1 if left == sum - left - a[i + 1]
    }

    -1
end

require "minitest/autorun"
require "byebug"
require "timeout"

# byebug
# solution(nil)
# exit

class TestSolution < Minitest::Test
    def test_default
        assert_equal 1, solution([-1, 3, -4, 5, 1, -6, 2, 1] )
    end

    def test_simple
        assert_equal 0, solution([0])
        assert_equal 0, solution([1])
        assert_equal 2, solution([1, 1, 1, 2])
        assert_equal 2, solution([-1, 1, 1])
    end

    def test_small
        assert_equal -1, solution([])
    end

    def test_large
        Timeout::timeout(6) {
            assert_equal 0, solution([0] * 100_000 )
        }
    end
end
