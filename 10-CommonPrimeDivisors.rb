def solution(a, b)
    count = 0
    a.each_with_index { |x, i| 
        y = b[i]
        z = gcd(x, y)
        count += 1 if same_primes(x / z, z) && same_primes(y / z, z)
    }
    count
end

def same_primes(a, z)
    az = gcd(a, z)
    if az == 1
        if z % a == 0
            true
        else
            false
        end
    else
        same_primes(a / az, z)
    end
end

def gcd(a, b)
    if a % b == 0
        b
    else
        gcd(b, a % b)
    end
end

require "minitest/autorun"
require "byebug"

class TestSolution < Minitest::Test
    def test_default
        assert_equal 1, solution([15, 10, 9], [75, 30, 5])
    end

    def test_simple_1
        assert_equal 1, solution([15], [75])
    end

    def test_simple_2
        assert_equal 0, solution([10], [30])
    end

    def test_simple_3
        assert_equal 0, solution([9], [5])
    end

    def test_larger_1
        assert_equal 0, solution([9000], [75])
    end

    def test_larger_2
        assert_equal 1, solution([9000], [750])
    end

    def test_many
        assert_equal 6000, solution([9000] * 6000, [750] * 6000)
    end
end
