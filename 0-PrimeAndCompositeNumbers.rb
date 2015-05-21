def divisors(n)
    i = 1
    result = 0
    while i * i < n
        result += 2 if n % i == 0
        i += 1
    end
    result += 1 if i * i == n
    result
end

def primality(n)
    i = 2
    while i * i <= n
        return false if n % i == 0
        i += 1
    end
    true
end
