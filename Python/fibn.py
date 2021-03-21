#!/usr/bin/env python3
# need first: pip install numba
# python fibn.py

from numba import jit
import time

@jit(nopython=True) # Set "nopython" mode for best performance, equivalent to @njit
def fib_recursive(n):
	if n <= 1: return n
	return fib_recursive(n - 1) + fib_recursive(n - 2)

def fib_iterative(n):
	a = 0
	b = 1
	for x in range(n):
		c = a + b
		a, b = b, c
	return a

t1 = time.time()
print(fib_recursive(42))
t2 = time.time()
print('Recursive took %0.3fsec.' % (t2-t1))

t1 = time.time()
print(fib_iterative(42))
t2 = time.time()
print('Iterative took %0.3fsec.' % (t2-t1))