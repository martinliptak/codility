# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(n, a)
    counters = [0] * n
    max = 0
    min = 0
    for i in a
        if 1 <= i and i <= n
            # increase
            if counters[i - 1] < min
                counters[i - 1] = min + 1
            else
                counters[i - 1] += 1
            end
            max = counters[i - 1] if counters[i - 1] > max
        elsif i == n + 1
            # max counter
            min = max
        end
    end
    counters.map { |c| c < min ? min : c }
end
