# Both fib and fib2 approaches work but cannot see which is faster as Ruby crashes
# with inputs over 15. Perhaps concurrency will not help speed sulution up. 
# Will check with Crystal, Rust and Go

def fib(n)
	return 1 if n <= 1
  	
  	x = Ractor.new do
  		ln = Ractor.receive
  		Ractor.yield(fib(ln - 1))
  	end
  	x.send(n)

	y = Ractor.new do
  		ln = Ractor.receive
  		Ractor.yield(fib(ln - 2))
  	end
  	y.send(n)

	x.take() + y.take() 
end

def fib2(n)
	return 1 if n <= 1
  	
  	xy = Ractor.new do
  		ln = Ractor.receive
  		Ractor.yield(fib(ln - 1) + fib(ln - 2))
  	end
  	xy.send(n)

	xy.take() 
end


start_time = Time.now
puts fib(42)
elapsed_time = Time.now - start_time
printf("elapsed time: %5.3f s.\n", elapsed_time)