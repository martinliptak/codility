# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(sizes, directions)
    stack = []
    eaten = 0
    sizes.each_with_index { |size, i| 
        case directions[i]
        when 0
            while stack.last and stack.last < size
                stack.pop
                eaten += 1 # eats 1
            end
            eaten += 1 if stack.last # eaten by 1
        when 1
            stack.push(size)
        end
    }
    sizes.count - eaten
end

require "minitest/autorun"
require "byebug"
require "timeout"

class TestSolution < Minitest::Test
    def test_default
        assert_equal 2, solution([4, 3, 2, 1, 5], [0, 1, 0, 0, 0]) 
    end

    def test_simple
        assert_equal 1, solution([4, 3, 2, 1], [1, 0, 0, 0]) 
        assert_equal 2, solution([4, 3, 2, 1], [1, 0, 0, 1]) 
        assert_equal 3, solution([4, 5, 2, 1], [1, 0, 0, 0]) 
        assert_equal 3, solution([3, 4, 5, 2, 1], [1, 1, 0, 1]) 
    end

    def test_small
        assert_equal 1, solution([1], [1])
    end

    def test_large
        Timeout::timeout(6) {
            assert_equal 100_000, solution((1..100_000).to_a, [0] * 100_000)
        }
    end
end
