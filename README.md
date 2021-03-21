# fib
Recursive & Iterative Fibonacci Benchmark - Multiple languages. 

Performance compare between languages and platforms using recursion & iteration.

Here is the Ruby version:

```
def fib_recursive(n)
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

start_time = Time.now
puts fib_recursive(42)
elapsed_time = Time.now - start_time
printf("Seconds Recursive took: %5.3f s.\n", elapsed_time)

start_time = Time.now
puts fib_iterative(42)
elapsed_time = Time.now - start_time
printf("Seconds Iterative took: %5.3f s.\n", elapsed_time)
```


Results on a Late 2013 15" Macbook Pro (2.3 GHz Quad-Core i7 - 16GB RAM - Catalina):

42nd number: 267914296. 

Showing only recursive as iterative versions are too fast: they take 0.000 secs in any language!


| Language  | secs.millis |       method       | command                                     |
| --------- | ----------- | -------------------| ------------------------------------------- |
| Ruby 3.0  |   26.840    |    recursive       | ruby fib.rb                                 |
| Ruby 3.0  |    8.821    |  recursive + jit   | ruby --jit-wait fib.rb                      |
| Crystal   |    1.452    |    recursive       | crystal build --release -Dpreview_mt fib.cr |
| Rust      |    0.858    |    recursive       | rustc -O fib.rs                             |
| Go        |             |                    |                                             |
| Python 3  |             |                    |                                             |
