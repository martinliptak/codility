def counting(a, max)
    count = [0] * (max + 1)
    a.each { |v| 
        count[v] += 1
    }
    count
end
