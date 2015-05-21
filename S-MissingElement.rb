# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    return 1 if a.empty?

    (1..a.count + 1).inject(:+) - a.inject(:+)
end

require "minitest/autorun"
require "byebug"
require "timeout"

class TestSolution < Minitest::Test
    def test_default
        input = [2, 3, 1, 5]
        output = 4
        assert_equal output, solution(input)
    end

    def test_simple_1
        input = [1, 2]
        output = 3
        assert_equal output, solution(input)
    end

    def test_simple_2
        input = [1, 3]
        output = 2
        assert_equal output, solution(input)
    end

    def test_simple_4
        input = [2, 3]
        output = 1
        assert_equal output, solution(input)
    end

    def test_empty
        input = [] 
        output = 1
        assert_equal output, solution(input)
    end

    def test_large
        input = (1..100_000).to_a
        output = 100_001
        Timeout::timeout(6) {
            assert_equal output, solution(input)
        }
    end
end
