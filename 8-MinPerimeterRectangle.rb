# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(n)
    min_perimeter = 2 * (1 + n)
    limit = Math.sqrt(n).floor
    (2..limit).each { |a|
        if n % a == 0
           b = n / a
           min_perimeter = [min_perimeter, 2 * (a + b)].min
        end
    }
    min_perimeter
end
