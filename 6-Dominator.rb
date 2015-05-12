# you can use puts for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  size = 0
  last_index = nil

  a.each_with_index { |val, i|
    if size == 0
      last_index = i
      size += 1
    else
      if a[last_index] == val
        size += 1
      else
        size -= 1
      end
    end
  }

  if size > 0 and a.count { |val| val == a[last_index] } > a.count / 2
    last_index
  else
    -1
  end
end

# improve tests

require "minitest/autorun"

describe "Solution" do
  it "works for example inputs" do
    input = [3, 4, 3, 2, 3, -1, 3, 3]
    output = 7
    input.permutation.each { |perm|
      puts input.inspect if solution(perm) != output
      solution(perm).must_equal output
    }
  end

  it "works for no leader inputs" do
    input = [3, 4, 1, 2, 3, -1, 3, 8]
    output = -1
    input.permutation.each { |perm|
      puts input.inspect if solution(perm) != output
      solution(perm).must_equal output
    }
  end

  it "works for no leader inputs" do
    input = [3, 4, 3, 2, 3, -1, 2, 3]
    output = -1
    input.permutation.each { |perm|
      puts input.inspect if solution(perm) != output
      solution(perm).must_equal output
    }
  end
end