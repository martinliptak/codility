# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
    # write your code in Ruby 2.2
end

require "minitest/autorun"

describe "Solution" do

  it "is correct for example inputs" do
    input = [4, 3, 4, 4, 4, 2]
    output = 2
    solution(input).must_equal output
  end
end