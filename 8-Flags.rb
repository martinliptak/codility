# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

# unfinished
def solution(a)
    if a.count >= 3
        distances = []
        last = nil
        (1...a.count - 1).each { |i|
            if a[i] > a[i - 1] and a[i] > a[i + 1]
                distances << i - last if last
                last = i
            end
        }
        puts distances.inspect
        
        (distances.count + 1).downto(1) { |flags|
            return flags if distances.all? { |d| d >= flags }
        }
    end
    0
end
