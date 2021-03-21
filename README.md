# fib
Recursive Fibonacci Benchmark - Multiple languages. 

The goal is to check if performance between languages and platforms behave in the same fashion as on my primes by trial division benchmark.
(Follows the same idea as drujensen/fib but will add concurrency)

Here is the single thread Ruby version:

```
def fib(n)
  return 1 if n <= 1
  fib(n - 1) + fib(n - 2)
end

puts fib(46)
```

Here is the single thread Crystal version:

```
def fib(n : UInt64)
  return 1_u64 if n <= 1
  fib(n - 1) + fib(n - 2)
end

puts fib(46)
```

Results on a Late 2013 15" Macbook Pro (2.3 GHz Quad-Core i7 - 16GB RAM - Catalina):


| Language  | Time secs.millis |
| --------- | ---------------- |
| Ruby      | x                |
| x         | x                |
