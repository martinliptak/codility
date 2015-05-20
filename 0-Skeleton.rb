def solution(n)
end

require "minitest/autorun"
require "byebug"
require "timeout"

class TestSolution < Minitest::Test
    def test_default
        input = nil
        output = nil
        assert_equal output, solution(input)
    end

    def test_simple_1
        input = nil
        output = nil
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
