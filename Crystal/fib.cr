# crystal build --release -Dpreview_mt fib.cr

def fib(n : UInt64)
  return 1_u64 if n <= 1
  fib(n - 1) + fib(n - 2)
end

elapsed_time = Time.measure do
  puts fib(42)
end
printf("elapsed time: %d.%d seconds.\n", elapsed_time.seconds, elapsed_time.milliseconds)
