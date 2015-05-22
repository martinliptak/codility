def solution(a)
    b = []
    a.each { |value|
        b << value if b.empty? or b.last != value
    }

    distinct = 0
    back = 0
    front = b.count - 1
    while back <= front
        if b[front].abs > b[back].abs
            front -= 1
        elsif b[front].abs < b[back].abs
            back += 1
        else # ==
            back += 1
            front -= 1
        end
        distinct += 1
    end
    distinct
end

require "minitest/autorun"
require "byebug"
require "timeout"

class TestSolution < Minitest::Test
    def test_default
        input = [-5, -3, -1, 0, 3, 6] 
        output = 5
        assert_equal output, solution(input)
    end

    def test_simple_1
        input = [-5, -3, -1, 1, 3, 6] 
        output = 4
        assert_equal output, solution(input)
    end

    def test_simple_2
        input = [-5, -3, -1, 1, 3, 5] 
        output = 3
        assert_equal output, solution(input)
    end

    def test_simple_3
        input = [-5, -3, -3, -1, 0, 0, 3, 6] 
        output = 5
        assert_equal output, solution(input)
    end

    def test_simple_4
        input = [1, 1, 1, 1, 1] 
        output = 1
        assert_equal output, solution(input)
    end

    def test_small
        input = [5] 
        output = 1
        assert_equal output, solution(input)
    end

    def test_large
        input = [-5] * 100_000 
        output = 1
        Timeout::timeout(6) {
            assert_equal output, solution(input)
        }
    end
end
