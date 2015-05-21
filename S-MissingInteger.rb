# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    hash = {}
    a.each { |v| 
        hash[v] = true
    }

    i = 1
    while true
        return i if not hash[i]
        i += 1
    end
end

require "minitest/autorun"
require "byebug"
require "timeout"

class TestSolution < Minitest::Test
    def test_default
        input = [1, 3, 6, 4, 1, 2] 
        output = 5
        assert_equal output, solution(input)
    end

    def test_one
        input = [4] 
        output = 1
        assert_equal output, solution(input)
    end

    def test_one_2
        input = [1] 
        output = 2
        assert_equal output, solution(input)
    end

    def test_one_3
        input = [0] 
        output = 1
        assert_equal output, solution(input)
    end

    def test_negative
        input = [-1, -2, -3] 
        output = 1
        assert_equal output, solution(input)
    end

    # def test_empty
    #     input = [] 
    #     output = 0
    #     assert_equal output, solution(input)
    # end

    # def test_large
    #     input = [0] * 100_000 
    #     output = 0
    #     Timeout::timeout(6) {
    #         assert_equal output, solution(input)
    #     }
    # end
end
