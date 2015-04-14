# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  return 1 if a.count == 0
  
  real_sum = a.inject(:+)
  expected_sum = (a.count + 1) * (a.count + 2) / 2.0
  (expected_sum - real_sum).to_i
end
