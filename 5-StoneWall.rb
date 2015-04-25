# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

# incorrect and slow
def solution(h)
    blocks = 0
    current = []
    h.each do |e|
        sum = current.any? ? current.inject(:+) : 0
        if sum > e
            current.each_with_index do |c, i|
                if e > c
                    e -= c
                elsif e < c
                    blocks += 1
                    current[i] = e
                    break
                else
                    # use the same block
                    current.slice!(i + 1)
                    break
                end
            end
        elsif sum < e
            blocks += 1
            current.push e - sum
        else
            # use the same blocks
        end
    end
    blocks
end