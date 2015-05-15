# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(m, a)
    n = a.count
    result = 0
    front = 0
    numbers = Array.new(m + 1, false)
    n.times { |back|
        while front < n and not numbers[a[front] - 1]
            numbers[a[front] - 1] = true
            front += 1
            result += front - back
            return 1_000_000_000 if result >= 1_000_000_000
        end
        numbers[a[back] - 1] = false
    }
    result
end
