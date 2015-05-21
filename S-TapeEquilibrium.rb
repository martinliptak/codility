def solution(a)
    first = 0
    second = a.inject(:+)
    (1..a.count - 1).map do |p|
        first += a[p - 1]
        second -= a[p - 1]
        (first - second).abs
    end.min
end

require "minitest/autorun"
require "byebug"
require "timeout"

class TestSolution < Minitest::Test
    def test_default
        input = [3, 1, 2, 4, 3] 
        output = 1
        assert_equal output, solution(input)
    end

    def test_simple_1
        input = [2, 4]
        output = 2
        assert_equal output, solution(input)
    end

    def test_simple_2
        input = [2, 2]
        output = 0
        assert_equal output, solution(input)
    end

    def test_simple_3
        input = [0, 2]
        output = 2
        assert_equal output, solution(input)
    end

    def test_simple_4
        input = [-2, 2, 4]
        output = 4
        assert_equal output, solution(input)
    end

    def test_simple_5
        input = [-1, 1]
        output = 2
        assert_equal output, solution(input)
    end

    def test_negative
        input = [-1, -2, -3, -4]
        output = 2
        assert_equal output, solution(input)
    end

    def test_large
        input = [1000] * 100_000 
        output = 0
        Timeout::timeout(6) {
            assert_equal output, solution(input)
        }
    end
end
