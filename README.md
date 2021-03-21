# fib
Recursive Fibonacci Benchmark - Multiple languages. 

The goal is to check if performance between languages and platforms behave in the same fashion as on my primes by trial division benchmark.
Follows the same idea as drujensen/fib but will add concurrency when possible.

Here is the single thread Ruby version:

```
def fib(n)
  	return 1 if n <= 1
  	fib(n - 1) + fib(n - 2)
end

start_time = Time.now
puts fib(42)
elapsed_time = Time.now - start_time
printf("elapsed time: %5.3f s.\n", elapsed_time)
```


Results on a Late 2013 15" Macbook Pro (2.3 GHz Quad-Core i7 - 16GB RAM - Catalina):
Unordered: ordered as coded. Prints: 433494437.


| Language  | secs.millis | single / concurrent | command                |
| --------- | ----------- | ------------------- | ---------------------- |
| Ruby 3.0  |   27.759    |       single        | ruby fib.rb            |
| Ruby 3.0  |    8.865    |       single        | ruby --jit-wait fib.rb |
|           |             |                     |                        |
