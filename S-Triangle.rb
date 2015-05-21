# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    a.sort!
    (0...a.count - 2).each { |i| 
      return 1 if a[i] + a[i + 1] > a[i + 2]
    }
    return 0
end

require "minitest/autorun"
require "byebug"
require "timeout"

class TestSolution < Minitest::Test
    def test_default_1
        input = [10, 2, 5, 1, 8, 20]
        output = 1
        assert_equal output, solution(input)
    end

    def test_default_2
        input = [10, 50, 5, 1]
        output = 0
        assert_equal output, solution(input)
    end

    def test_negative
        input = [-10, -2, -5, -1, -8, -20]
        output = 0
        assert_equal output, solution(input)
    end

    def test_simple_1
        input = [-1, 0, 1, 2, 3]
        output = 0
        assert_equal output, solution(input)
    end

    def test_simple_2
        input = [1, 2, 3, 4]
        output = 1
        assert_equal output, solution(input)
    end

    def test_empty
        input = [] 
        output = 0
        assert_equal output, solution(input)
    end

    def test_large
        input = [1] * 100_000 
        output = 1
        Timeout::timeout(6) {
            assert_equal output, solution(input)
        }
    end
end
