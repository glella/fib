# set CRYSTAL_WORKERS 16
# crystal build --release -Dpreview_mt fibc.cr

def fib(n : UInt64)
  return 1_u64 if n <= 1

  ch = Channel(UInt64).new(16)
  spawn do
    ch.send(fib(n - 1))
  end

  spawn do
    ch.send(fib(n - 2))
  end

  ch.receive + ch.receive
end

def fib2(n : UInt64)
  return 1_u64 if n <= 1

  ch = Channel(UInt64).new(16)
  spawn do
    ch.send(fib(n - 1))
    ch.send(fib(n - 2))
  end

  ch.receive + ch.receive
end

elapsed_time = Time.measure do
  puts fib2(42)
end
printf("elapsed time: %d.%d seconds.\n", elapsed_time.seconds, elapsed_time.milliseconds)
