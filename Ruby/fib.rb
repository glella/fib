#ruby --jit-wait fib.rb

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

# def prompt(*args)
#     print(*args)
#     gets
# end

start_time = Time.now
puts fib_recursive(42)
elapsed_time = Time.now - start_time
printf("Seconds Recursive took: %5.3f s.\n", elapsed_time)

# n = (prompt "Fib number: ").to_i

start_time = Time.now
puts fib_iterative(42)
elapsed_time = Time.now - start_time
printf("Seconds Iterative took: %5.3f s.\n", elapsed_time)