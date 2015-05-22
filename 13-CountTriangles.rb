def solution(a)
    a.sort!

    result = 0
    for x in (0...a.count)
        z = 0
        for y in (x + 1...a.count)
            while z < a.count && a[x] + a[y] > a[z]
                z += 1
            end
            result += z - y - 1
        end
    end
    result
end

require "minitest/autorun"
require "byebug"
require "timeout"

class TestSolution < Minitest::Test
    def test_default
        assert_equal 4, solution([10, 2, 5, 1, 8, 12] )
        assert_equal 5, solution([10, 2, 5, 1, 8, 11])
    end

    def test_simple
        assert_equal 0, solution([1, 2, 3])
        assert_equal 1, solution([1, 2, 3, 4])
        assert_equal 7, solution([1, 2, 3, 4, 5, 6])
    end

    def test_small
        assert_equal 0, solution([])
        assert_equal 0, solution([1])
        assert_equal 0, solution([1, 2])
    end

    def test_large
        Timeout::timeout(6) {
            assert_equal 166167000, solution([1] * 1_000)
        }
    end
end
