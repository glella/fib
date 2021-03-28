# fib
Recursive & Iterative Fibonacci Benchmark - Multiple languages. 

Performance compare between languages using recursion & iteration.

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

Showing only recursive as iterative versions are way faster. (So much faster that had to double check compilers were not computing it at compile time).


| Language       | secs.millis |       method          | command                                     |
| -------------- | ----------- | --------------------- | ------------------------------------------- |
| Ruby 3.0       |   26.840    |    recursive          | ruby fib.rb                                 |
| Ruby 3.0       |    8.821    |  recursive + jit      | ruby --jit-wait fib.rb                      |
| Crystal 0.36.1 |    1.452    |    recursive          | crystal build --release -Dpreview_mt fib.cr |
| Rust 1.50.0    |    0.853    |    recursive          | rustc -O fib.rs                             |
| Go 1.16.1      |    1.740    |    recursive          | go build fib.go                             |
| Python 3.9.2   |  113.887    |    recursive          | python fib.py                               |
| Python 3.9.2   |    2.703    | recursive + numba jit | python fibn.py (includes compilation time!) |
| Python + Rust  |    0.850    | Python calling Rust   | python fib_rust_module.py  (awesome!)       |
| Swift 5.3.2    |    1.400    |    recursive          | (xcode release)                             |
| C clang 12.0.0 |    1.288    |	recursive          | clang -O3 fib.c -o fib                      |
| Zig 0.8.0      |    1.481    |    recursive          | zig build-exe fib.zig -O ReleaseSafe        |
| V 0.2.2        |    2.305    |    recursive          | v -autofree fib.v                           |
