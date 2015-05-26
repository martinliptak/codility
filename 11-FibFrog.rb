def solution(a)
    n = a.count
    return 1 if n == 0

    fb = fibonacci_to(n + 1)
    fb.shift(2)

    dp = [nil] * (n + 1)
    dp[0] = 0
    for i in (1..n + 1)
        next if a[i - 1] == 0

        for f in fb
            break if i - f < 0

            if dp[i - f]
                dp[i] = if dp[i]
                    [dp[i], dp[i - f] + 1].min
                else
                    dp[i - f] + 1
                end
            end
        end
    end
    # puts a.inspect
    # puts fb.inspect
    # puts dp.inspect

    dp[n + 1] || -1
end

def fibonacci_to(max)
    f = [0, 1]
    i = 1
    while f[i] <= max
        i += 1
        f[i] = f[i - 2] + f[i - 1]
    end
    f
end

require "minitest/autorun"
require "byebug"
require "timeout"

# byebug
# solution(nil)
# exit

class TestSolution < Minitest::Test
    def test_default
        assert_equal 3, solution([0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0] )
    end

    def test_simple
        assert_equal 1, solution([0])
        assert_equal 1, solution([0, 0])

        assert_equal -1, solution([0, 0, 0])
        assert_equal 2, solution([1, 0, 0])
        assert_equal 2, solution([0, 1, 0])
        assert_equal 2, solution([0, 0, 1])

        assert_equal 1, solution([0, 0, 1, 0])
        assert_equal 2, solution([0, 0, 1, 0, 0])
        assert_equal -1, solution([0, 0, 1, 0, 0, 0])
        assert_equal 3, solution([0, 0, 1, 0, 0, 1])
        assert_equal 1, solution([0, 0, 1, 0, 0, 0, 0])
    end

    def test_small
        assert_equal 1, solution([])
    end

    def test_large
        Timeout::timeout(6) {
            assert_equal -1, solution([0] * 100_000 )
        }
        Timeout::timeout(6) {
            assert_equal 6, solution([1] * 100_000 )
        }
    end
end
