def solution(n)
end

require "minitest/autorun"
require "byebug"
require "timeout"

# byebug
# solution(nil)
# exit

class TestSolution < Minitest::Test
    def test_default
        assert_equal nil, solution(nil)
    end

    # def test_simple
    #     assert_equal nil, solution(nil)
    # end

    # def test_small
    #     assert_equal nil, solution(nil)
    # end

    # def test_large
    #     Timeout::timeout(6) {
    #         assert_equal 0, solution([0] * 100_000 )
    #     }
    # end
end
