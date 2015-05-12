# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    return 0 if a.count <= 1
    
    max_profit = 0
    min_price = a.first
    a[1..-1].each { |price|
        max_profit = [max_profit, price - min_price].max
        min_price = [min_price, price].min
    }
    max_profit
end
