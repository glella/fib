# fib
Recursive Fibonacci Benchmark - Multiple languages. 

The goal is to check if performance between languages and platforms behave in the same fashion as on my primes by trial division benchmark.

Will solve it recusively but will add other methods like iterators for comparison.

Here is the recursive Ruby version:

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

Ordered as coded. 

Prints: 433494437.


| Language  | secs.millis |       method       | command                                     |
| --------- | ----------- | -------------------| ------------------------------------------- |
| Ruby 3.0  |   27.759    |    recursive       | ruby fib.rb                                 |
| Ruby 3.0  |    8.865    |  recursive + jit   | ruby --jit-wait fib.rb                      |
| Crystal   |    1.478    |    recursive       | crystal build --release -Dpreview_mt fib.cr |
|           |             |                    |                                             |

