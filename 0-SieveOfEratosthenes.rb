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
