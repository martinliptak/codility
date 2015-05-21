# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    sums = prefix_sums(a)
    min = nil
    min_from = nil
    (0..a.count - 2).each { |i|
        (i + 1..[i + 4, a.count - 1].min).each { |j|
            avg = (sums[j + 1] - sums[i]).to_f / (j - i + 1)
            if min
                if avg < min
                    min = avg
                    min_from = i
                end
            else
                min = avg
                min_from = 0
            end
        }
    }
    min_from
end

def prefix_sums(a)
    sums = [0] * (a.count + 1)
    1.upto(a.count) { |i| 
        sums[i] = sums[i - 1] + a[i - 1]
    }
    sums
end

require "minitest/autorun"
require "byebug"
require "timeout"

class TestSolution < Minitest::Test
    def test_default
        input = [4, 2, 2, 5, 1, 5, 8] 
        output = 1
        assert_equal output, solution(input)
    end

    def test_simple_1
        input = [4, 5, 2, 4, 1, 5, 8] 
        output = 2
        assert_equal output, solution(input)
    end

    def test_small
        input = [1, -1] 
        output = 0
        assert_equal output, solution(input)
    end

    def test_large
        input = [10_000] * 100_000 
        output = 0
        Timeout::timeout(6) {
            assert_equal output, solution(input)
        }
    end
end
