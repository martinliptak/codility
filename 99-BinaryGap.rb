# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(n)
    open = false
    current = 0
    max = 0
    begin
        if n % 2 == 1
            open = true
            max = [max, current].max
            current = 0
        else
            current += 1 if open
        end
    end while (n /= 2) > 0
    max
end