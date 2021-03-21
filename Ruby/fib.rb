#ruby --jit-wait fib.rb

def fib(n)
  return 1 if n <= 1
  fib(n - 1) + fib(n - 2)
end

start_time = Time.now
puts fib(42)
elapsed_time = Time.now - start_time
printf("elapsed time: %5.3f s.\n", elapsed_time)