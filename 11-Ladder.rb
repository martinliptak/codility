# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a, b)
    f = [0] * (a.count + 2)
    f[1] = 1
    (2...a.count + 2).each { |i|
        f[i] = f[i - 2] + f[i - 1]
    }
    
    r = []
    a.each_with_index { |_, i|
        r << f[a[i] + 1] % (2 ** b[i])
    }
    r
end
