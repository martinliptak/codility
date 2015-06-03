def solution(x, a)
    total_different = a.count { |v| v != x }
    different = 0
    equal = 0
    (0...a.count).each { |k| 
        return k if equal == total_different - different

        if a[k] == x
            equal += 1 
        else
            different += 1 
        end
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
        assert_equal 4, solution(5, [5, 5, 1, 7, 2, 3, 5])
    end

    def test_simple
        assert_equal 1, solution(3, [3, 5])
        assert_equal 3, solution(3, [1, 3, 5, 1])
        assert_equal 3, solution(3, [1, 2, 5, 3])
        assert_equal -1, solution(3, [5, 5, 5])
        assert_equal 0, solution(5, [5, 5, 5])
    end

    def test_small
        assert_equal 0, solution(5, [5])
        assert_equal -1, solution(5, [6])
    end

    def test_large
        Timeout::timeout(6) {
            assert_equal 0, solution(1, [1] * 100_000 )
            assert_equal -1, solution(2, [1] * 100_000 )
        }
    end
end
