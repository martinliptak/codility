def prefix_sums(a)
    sums = [0] * (a.count + 1)
    1.upto(a.count) { |i| 
        sums[i] = sums[i - 1] + a[i - 1]
    }
    sums
end
