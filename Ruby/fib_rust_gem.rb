# ruby fib_rust_gem.rb
# ruby --jit-wait fib_rust_gem.rb

require 'Fib'

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
puts Fib[42]
elapsed_time = Time.now - start_time
printf("Seconds Recursive took: %5.3f s.\n", elapsed_time)


start_time = Time.now
puts fib_iterative(42)
elapsed_time = Time.now - start_time
printf("Seconds Iterative took: %5.3f s.\n", elapsed_time)