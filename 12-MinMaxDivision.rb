# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(k, m, a)
    from = a.max
    to = a.inject(:+)
    min = from
    while from <= to
        mid = (from + to) / 2
        if check(mid, k, m, a)
            min = mid
            to = mid - 1
        else
            from = mid + 1
        end
    end
    min
end

def check(max, k, m, a)
    used_blocks = 1
    block_sum = 0
    a.each { |v| 
        block_sum += v
        if block_sum > max
            block_sum = v
            used_blocks += 1
            return false if used_blocks > k
        end
    }
    return true
end

require "minitest/autorun"
require "byebug"
require "timeout"

class TestSolution < Minitest::Test
    def test_default
        assert_equal 6, solution(3, 5, [2, 1, 5, 1, 2, 2, 2])
    end

    def test_simple_1
        assert_equal 4, solution(2, 4, [3, 1, 1, 1, 1, 1])
    end

    def test_zeros
        assert_equal 0, solution(3, 4, [0, 0, 0, 0])
    end

    def test_ones
        assert_equal 2, solution(2, 4, [1, 1, 1, 1])
    end

    def test_large
        Timeout::timeout(6) {
            assert_equal 1, solution(100_000, 0, [1] * 100_000)
        }
    end
end
