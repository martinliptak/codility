# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(s, p, q)
    counts = [nil, [0], [0], [0], [0]]
    factors = s.split(//).map do |nu|
        case nu
            when 'A'
                1
            when 'C'
                2
            when 'G'
                3
            when 'T'
                4
        end
    end
    for i in (1..factors.length)
        fa = factors[i - 1]
        for j in [1, 2, 3, 4]
            counts[j][i] = counts[j][i - 1]
        end
        counts[fa][i] += 1
    end
    
    (0..p.count - 1).map { |k|
        if p[k] == q[k]
            factors[p[k]]
        else
            [1, 2, 3, 4].index do |i|
                counts[i][q[k] + 1] - counts[i][p[k]] > 0
            end + 1
        end
    }
end
