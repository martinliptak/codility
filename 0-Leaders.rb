def leader(a)
  stack_size = 0
  stack_top = nil

  a.each_with_index { |value, i|
    if stack_size == 0
      stack_top = value
      stack_size += 1
    else
      if stack_top == value
        stack_size += 1
      else
        stack_size -= 1
      end
    end
  }

  if stack_size > 0 and a.count { |value| value == stack_top } > a.count / 2
    stack_top
  else
    -1
  end
end
