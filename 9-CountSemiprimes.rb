# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(n, p, q)
    primes = []
    sieve(n).each_with_index { |v, i| 
        primes << i if v
    }
    #puts primes
    
    semiprimes = [false] * (n + 1)
    primes.each { |x|
        primes.each { |y|
            sp = x * y
            break if sp > n
            semiprimes[sp] = true
        }
    }
    #puts semiprimes.inspect
   
    counts = [0]
    (1..n).each { |i|
        counts[i] = counts[i - 1]
        counts[i] += 1 if semiprimes[i]
    }
    #puts counts.inspect
    
    result = []
    p.each_with_index { |a, i| 
        b = q[i]
        result << counts[b] - counts[a - 1]
    }
    result
end

def sieve(n)
    result = [true] * (n + 1)
    result[0] = result[1] = false
    i = 2
    while i * i <= n
        if result[i]
            k = i * i
            while k <= n
                result[k] = false
                k += i
            end
        end
        i += 1
    end
    result
end
