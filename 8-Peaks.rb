# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    if a.count >= 3
        peaks = [0] * (a.count + 1)
        (1...a.count - 1).each { |i| 
            peaks[i + 1] = peaks[i]
            peaks[i + 1] += 1 if a[i] > a[i - 1] and a[i] > a[i + 1]
        }
        peaks[a.count] = peaks[a.count - 1]
        
        block_sizes = (2..Math.sqrt(a.count).floor).select { |i|
            a.count % i == 0 
        }.flat_map { |i|
            [i, a.count / i]
        }.sort.uniq
        block_sizes << a.count
        
        block_sizes.each { |block_size|
            all_with_a_peak = (0...a.count).step(block_size).all? { |block_start|
               peaks[block_start + block_size] > peaks[block_start]
            } 
            return a.count / block_size if all_with_a_peak
        }
    end
    
    return 0
end