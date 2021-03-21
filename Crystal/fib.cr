# crystal build --release -Dpreview_mt fib.cr

def fib_recursive(n : UInt64)
  return n if n <= 1
  fib_recursive(n - 1) + fib_recursive(n - 2)
end

def fib_iterative(n)
  a = 0
  b = 1
  (0...n).each {
    c = a + b
    a, b = b, c
  }
  a
end

elapsed_time = Time.measure do
  puts fib_recursive(42)
end
printf("Recursive took: %d.%d seconds.\n", elapsed_time.seconds, elapsed_time.milliseconds)

elapsed_time = Time.measure do
  puts fib_iterative(42)
end
printf("Iterative took: %d.%d seconds.\n", elapsed_time.seconds, elapsed_time.milliseconds)
