# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    a.map! { |e| e.abs }
    a.uniq.count
end