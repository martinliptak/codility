def solution(a)
    dp = [0] + [nil] * (a.count - 1)
    dp[0] = a[0]
    for i in (1...a.count)
        for j in (i - 6...i)
            if j >= 0
                dp[i] = if dp[i]
                    [dp[i], dp[j] + a[i]].max
                else
                    dp[j] + a[i]
                end
            end
        end
    end
    dp.last
end

require "minitest/autorun"
require "byebug"
require "timeout"

# byebug
# solution(nil)
# exit

class TestSolution < Minitest::Test
    def test_default
        assert_equal 8, solution([1, -2, 0, 9, -1, -2] )
    end

    def test_simple_1
        assert_equal 15, solution([1, 2, 3, 4, 5])
        assert_equal 12, solution([1, 2, -3, 4, 5])
        assert_equal 45, solution([1, 2, 3, 4, 5, 6, 7, 8, 9])
        assert_equal 16, solution([1, -2, -3, -4, -5, -6, -7, 8, 9])
    end

    def test_simple_2
        assert_equal 8, solution([1, -2, -3, -4, -5, -2, -7, -8, 9])
    end

    def test_small
        assert_equal 9, solution([-1, 10])
        assert_equal -9, solution([1, -10])
        assert_equal -11, solution([-1, -10])
    end

    def test_large
        Timeout::timeout(6) {
            assert_equal 100_000, solution([1] * 100_000 )
        }
    end
end
