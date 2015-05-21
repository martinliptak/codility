def fibonacci(n)
  f = [0] * (n + 2)
  f[1] = 1
  (2..n + 1).each { |i|
      f[i] = f[i - 2] + f[i - 1]
  }
  f
end
