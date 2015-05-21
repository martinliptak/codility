def gcd(a, b)
    if a % b == 0
        b
    else
        gcd(b, a % b)
    end
end

def lcm(a, b)
    (a * b) / gcd(a, b)
end
