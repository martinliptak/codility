# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    east = 0
    passing = 0
    a.each { |v| 
        case v
        when 0
            east += 1
        when 1
            passing += east
            return -1 if passing > 1_000_000_000
        end
    }
    passing
end

require "minitest/autorun"
require "byebug"
require "timeout"

class TestSolution < Minitest::Test
    def test_default
        input = [0, 1, 0, 1, 1] 
        output = 5
        assert_equal output, solution(input)
    end

    def test_one_east
        input = [0] 
        output = 0
        assert_equal output, solution(input)
    end

    def test_one_west
        input = [1] 
        output = 0
        assert_equal output, solution(input)
    end

    def test_simple_1
        input = [1, 1, 0, 1, 1, 0] 
        output = 2
        assert_equal output, solution(input)
    end

    def test_many
        input = [0] * 50_000 + [1] * 50_000 
        output = -1
        assert_equal output, solution(input)
    end

    def test_many_2
        input = [1] * 50_000 + [0] * 50_000 
        output = 0
        assert_equal output, solution(input)
    end
end
