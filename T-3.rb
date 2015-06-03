def solution(a)
    current = [0, 0]
    direction = :north
    lines = []
    a.each_with_index { |v, i|
        step = current.clone

        case direction
        when :north
            step[1] -= v
            direction = :east
        when :east
            step[0] += v
            direction = :south
        when :south
            step[1] += v
            direction = :west
        when :west
            step[0] -= v
            direction = :north
        end

        current_line = [current, step]
        if lines.count > 1
            (0...lines.count - 1).each { |j| 
                return i + 1 if intersect(lines[j], current_line)
            }
        end

        #todo: limit to accessible lines

        lines << [current, step]
        current = step
    }
    0
end

def intersect(a, b)
    condition = lambda { |a, b| 
        a[0][0] >= [b[0][0], b[1][0]].min && a[0][0] <= [b[0][0], b[1][0]].max \
            && b[0][1] >= [a[0][1], a[1][1]].min && b[0][1] <= [a[0][1], a[1][1]].max
    }
    condition[a, b] || condition[b, a]
end

require "minitest/autorun"
require "byebug"
require "timeout"

# byebug
# solution(nil)
# exit

class TestSolution < Minitest::Test
    def test_default
        assert_equal 7, solution([1, 3, 2, 5, 4, 4, 6, 3, 2] )
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
