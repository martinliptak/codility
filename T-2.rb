# probably slow
def solution(a)
    s = 0
    a.each_with_index { |v, i| 
        s += v * (-2)**i
    }

    s = -s

    x = 0xAAAAAAAA
    r = (s + x) ^ x
    r = ("%b" % r).reverse.split(//).map { |b| b.to_i }
    r == [0] ? [] : r
end

# one more optimization, but still slow
def solution(a)
    s = 0
    e = 1
    a.each { |v| 
        s += v * e
        e *= -2
    }

    s = -s

    x = 0xAAAAAAAA
    r = (s + x) ^ x
    r = ("%b" % r).reverse.split(//).map { |b| b.to_i }
    r == [0] ? [] : r
end

# final solution
def solution(a)
    # 0 - a
    table = {
        -2 => { bit: 0, carry: 1}, 
        -1 => { bit: 1, carry: 1}, 
        0 => { bit: 0, carry: 0}, 
        1 => { bit: 1, carry: 0}, 
        2 => { bit: 0, carry: -1}, 
        3 => { bit: 1, carry: -1}
    }
    carry = 0
    (0..a.count).each { |i|
        number = 0 + (a[i] || 0) * (-1) + carry
        a[i] = table[number][:bit]
        carry = table[number][:carry]
    }

    # remove trailing zeros
    last_one = a.rindex(1)
    if last_one
        a = a[0..last_one]
    else
        a = []
    end

    a
end

require "minitest/autorun"
require "byebug"
require "timeout"

# byebug
# solution([1])
# exit

class TestSolution < Minitest::Test
    def test_default
        assert_equal [1, 1, 0, 1], solution([1, 0, 0, 1, 1])
        assert_equal [1, 1, 0, 1, 0, 1, 1], solution([1, 0, 0, 1, 1, 1] )

        assert_equal [1, 0, 0, 1, 1], solution([1, 1, 0, 1])
        assert_equal [1, 0, 0, 1, 1, 1], solution([1, 1, 0, 1, 0, 1, 1])
    end

    def test_simple
        assert_equal [1, 1], solution([1])
    end

    def test_small
        assert_equal [], solution([])
    end

    def test_large
        Timeout::timeout(6) {
            assert_equal [], solution([0] * 100_000 )
        }
    end
end
